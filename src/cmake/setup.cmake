function(naulatex_setup SUBJECT JOB)
	set(LOCK "${NAULATEX_CONTENTS_DIRECTORY}/configured.lock" )

	message(STATUS "Configuring latex template...")
	macro(show_settings)
		message(STATUS "Selected subject:job => ${SUBJECT}:${JOB}")
	endmacro()
	show_settings()
if (EXISTS "${LOCK}")
		message(STATUS "The lockfile already exists, "
			"subject have been already selected and configured"
		)
		file(STRINGS "${LOCK}" lock) 
		list(GET lock 0 SUBJECT)
		list(GET lock 1 JOB)
		message(STATUS "Settings from lockfile:")
		show_settings()
	else()
		message(STATUS "The lockfile doesn't exists, "
			"setting NAULATEX_OVERRIDE to YES"
		)
		set(NAULATEX_OVERRIDE YES)
	endif()

	set(SUBJECT_PATH "${NAULATEX_TEMPLATES_DIRECTORY}/subjects/${SUBJECT}")
	set(JOB_PATH "${NAULATEX_TEMPLATES_DIRECTORY}/jobs/${JOB}")

	if(DEFINED NAULATEX_OVERRIDE)
		if(NAULATEX_OVERRIDE)
			message(STATUS "Because NAULATEX_OVERRIDE=YES, "
				"current project will be reconfigured"
			)
			set(RECONFIGURE YES)
		else()
			message(STATUS "Because NAULATEX_OVERRIDE=NO, "
				"project chapters won't be reconfigured"
			)
			set(RECONFIGURE NO)
		endif()
	else()
		message(STATUS "If you want to reconfigure contents/, "
			"configure with -DNAULATEX_OVERRIDE=YES"
		)
		set(RECONFIGURE NO)
	endif()

	if (NOT EXISTS ${SUBJECT_PATH})
		message(FATAL_ERROR "Selected subject (${SUBJECT}) "
			"does not exists in ${NAULATEX_TEMPLATES_DIRECTORY}/subjects"
		)
	elseif(NOT EXISTS ${JOB_PATH})
		message(FATAL_ERROR "Selected job (${JOB}) "
			"does not exists in ${NAULATEX_TEMPLATES_DIRECTORY}/jobs"
		)
	endif()

	if(RECONFIGURE)
		message(STATUS "Setting up chapters")
		file(REMOVE_RECURSE "${NAULATEX_CONTENTS_DIRECTORY}/chapters")
		file(COPY "${SUBJECT_PATH}/chapters"
			DESTINATION "${NAULATEX_CONTENTS_DIRECTORY}"
		)
		file(CONFIGURE
			OUTPUT "${NAULATEX_CONTENTS_DIRECTORY}/configured.lock"
			@ONLY CONTENT "@SUBJECT@\n@JOB@"
		)
	else()
		message(STATUS "Setting up chapters - skipped")
	endif()

	message(STATUS "Setting up chapters header")
	configure_file(${SUBJECT_PATH}/chapters.tex
		${NAULATEX_CONFIG_DIRECTORY}/chapters.tex
		COPYONLY
	)
	message(STATUS "Setting up subject defines")
	configure_file(${SUBJECT_PATH}/defines.tex
		${NAULATEX_CONFIG_DIRECTORY}/subjectDefines.tex
		COPYONLY
	)

	message(STATUS "Setting up job defines")
	configure_file(${JOB_PATH}/defines.tex
		${NAULATEX_CONFIG_DIRECTORY}/jobDefines.tex
		COPYONLY
	)

	message(STATUS "Setting up bibliography")
	configure_file(${SUBJECT_PATH}/bibliography.bib
		${NAULATEX_CONFIG_DIRECTORY}/bibliography.bib
		COPYONLY
	)
	file(TOUCH "${NAULATEX_CONTENTS_DIRECTORY}/bibliography.bib")

	file(MAKE_DIRECTORY ${NAULATEX_CONFIG_DIRECTORY}/matter)
	set(MATTER title frontmatter backmatter)
	foreach(matter ${MATTER})
		if(EXISTS ${SUBJECT_PATH}/matter/${matter}.tex)
			message(STATUS "Current subject has custom ${matter}")
			configure_file(${SUBJECT_PATH}/matter/${matter}.tex
				${NAULATEX_CONFIG_DIRECTORY}/matter/${matter}.tex
				COPYONLY
			)
		else()
			message(STATUS "Using default ${matter} (matter/${matter}.tex)")
			configure_file(${NAULATEX_TEMPLATES_DIRECTORY}/matter/${matter}.tex
				${NAULATEX_CONFIG_DIRECTORY}/matter/${matter}.tex
				COPYONLY
			)
		endif()
	endforeach()
	
	set(NAULATEX_OVERRIDE OFF CACHE BOOL 
		"Trigger chapters overriding" FORCE
	)
endfunction()
