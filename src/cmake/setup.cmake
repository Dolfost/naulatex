function(naulatex_setup SUBJECT JOB)
	set(SUBJECTDIR ${TEXSRCDIR}/subjects/${SUBJECT})
	set(JOBDIR ${TEXSRCDIR}/jobs/${JOB})

	message(STATUS "Configuring latex template...")
	message(STATUS "Selected subject - ${SUBJECT}")
	message(STATUS "Selected job - ${JOB}")
	if (EXISTS ${TEXSRCDIR}/chapters)
		message(STATUS "The chapters/ forlder already exists, "
			"subject have been already selected"
		)
	endif()

	if(DEFINED NAULATEX_OVERRIDE_CHAPTERS)
		if(NAULATEX_OVERRIDE_CHAPTERS)
			message(STATUS "Because NAULATEX_OVERRIDE_CHAPTERS=YES, "
				"chapters will be overriden"
			)
			set(OVERRIDE_CHAPTERS YES)
		else()
			message(STATUS "Because NAULATEX_OVERRIDE_CHAPTERS=NO, "
				"chapters won't be overriden"
			)
			set(OVERRIDE_CHAPTERS NO)
		endif()
	else()
		message(STATUS "If you want to override chapters/, "
			"configure with -DNAULATEX_OVERRIDE_CHAPTERS=YES"
		)
			set(OVERRIDE_CHAPTERS NO)
	endif()

	if (NOT EXISTS ${SUBJECTDIR})
		message(FATAL_ERROR "Selected subject (${SUBJECT}) "
			"does not exists in ${TEXSRCDIR}/subjects"
		)
	elseif(NOT EXISTS ${JOBDIR})
		message(FATAL_ERROR "Selected job (${JOB}) "
			"does not exists in ${TEXSRCDIR}/jobs"
		)
	endif()

	if(OVERRIDE_CHAPTERS)
		message(STATUS "Setting up chapters")
		file(COPY ${SUBJECTDIR}/chapters
			DESTINATION ${TEXSRCDIR}
		)
	else()
		message(STATUS "Setting up chapters - skipped")
	endif()

	message(STATUS "Setting up subject defines")
	configure_file(${SUBJECTDIR}/defines.tex
		${TEXBINDIR}/subjectDefines.tex
		COPYONLY
	)

	message(STATUS "Setting up job defines")
	configure_file(${JOBDIR}/defines.tex
		${TEXBINDIR}/jobDefines.tex
		COPYONLY
	)

	message(STATUS "Setting up bibliography")
	configure_file(${SUBJECTDIR}/bibliography.bib
		${TEXBINDIR}/bibliography.bib
		COPYONLY
	)

	file(MAKE_DIRECTORY ${TEXBINDIR}/matter)
	set(MATTER title frontmatter backmatter)
	foreach(matter ${MATTER})
		if(EXISTS ${SUBJECTDIR}/matter/${matter}.tex)
			message(STATUS "Current subject has custom ${matter}")
			configure_file(${SUBJECTDIR}/matter/${matter}.tex
				${TEXBINDIR}/matter/${matter}.tex
				COPYONLY
			)
		else()
			message(STATUS "Using default ${matter} (matter/${matter}.tex)")
			configure_file(${TEXSRCDIR}/matter/${matter}.tex
				${TEXBINDIR}/matter/${matter}.tex
				COPYONLY
			)
		endif()
	endforeach()
	
	set(NAULATEX_OVERRIDE_CHAPTERS OFF CACHE BOOL 
		"Trigger template generation" FORCE
	)
endfunction()
