function(naulatex_setup SUBJECT JOB)
	set(SUBJECTDIR ${TEXSRCDIR}/subjects/${SUBJECT})
	set(JOBDIR ${TEXSRCDIR}/jobs/${JOB})

	message(STATUS "Configuring latex template...")
	message(STATUS "Selected subject - ${SUBJECT}")
	message(STATUS "Selected job - ${JOB}")
	if (EXISTS ${TEXSRCDIR}/chapters)
		message(STATUS "The chapters/ forlder already exists")
		message(STATUS "This means that subject have been already selected")
	endif()

	if(DEFINED NAULATEX_OVERRIDE_SUBJECT)
		if(NAULATEX_OVERRIDE_SUBJECT)
			message(STATUS "Because NAULATEX_OVERRIDE_SUBJECT=YES, the selection will be redefined")
		else()
			message(STATUS "Because NAULATEX_OVERRIDE_SUBJECT=NO, the selection won't be redefined")
			return()
		endif()
	else()
		message(STATUS "If you want to override selection, configure with -DNAULATEX_OVERRIDE_SUBJECT=YES")
		return()
	endif()


	message(STATUS "Selected subject - ${SUBJECT}")
	message(STATUS "Selected job - ${JOB}")

	file(COPY ${SUBJECTDIR}/chapters
		DESTINATION ${TEXSRCDIR}
	)

	file(COPY_FILE ${SUBJECTDIR}/defines.tex
		${TEXBINDIR}/subjectDefines.tex
	)

	file(COPY_FILE ${SUBJECTDIR}/bibliography.bib
		${TEXBINDIR}/bibliography.bib
	)

	file(COPY_FILE ${JOBDIR}/defines.tex
		${TEXBINDIR}/jobDefines.tex
	)

	file(MAKE_DIRECTORY ${TEXBINDIR}/matter)
	set(MATTER title frontmatter backmatter)
	foreach(matter ${MATTER})
		if(EXISTS ${SUBJECTDIR}/matter/${matter}.tex)
			message(STATUS "Current subject has custom ${matter}")
			file(COPY_FILE ${SUBJECTDIR}/matter/${matter}.tex
				${TEXBINDIR}/matter/${matter}.tex
			)
		else()
			message(STATUS "Using default ${matter} (matter/${matter}.tex)")
			file(COPY_FILE ${TEXSRCDIR}/matter/${matter}.tex
				${TEXBINDIR}/matter/${matter}.tex
			)
		endif()
	endforeach()
	
	set(NAULATEX_OVERRIDE_SUBJECT OFF CACHE BOOL 
		"Trigger template generation" FORCE
	)
endfunction()
