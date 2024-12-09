function(lrt_setup SUBJECT JOB)
	set(CHAPTERS_LOCK "${LRT_CONTENTS_DIRECTORY}/chapters.lock" )

	message(STATUS "Configuring latex template...")
	macro(show_settings PREF)
		message(STATUS "${PREF} subject:job => ${SUBJECT}:${JOB}")
	endmacro()
	show_settings("Settings from options:")
	if (EXISTS "${CHAPTERS_LOCK}")
		message(STATUS "Chpaters lockfile already exists, "
			"chapters have been already selected and configured"
		)
		file(STRINGS "${CHAPTERS_LOCK}" lock) 
		list(GET lock 0 SUBJECT)
		list(GET lock 1 JOB)
		show_settings("Settings from chapters lockfile:")
	else()
		message(STATUS "The lockfile doesn't exists, "
			"setting LRT_OVERRIDE_CHAPTERS to YES"
		)
		set(LRT_OVERRIDE_CHAPTERS YES)
	endif()

	set(SUBJECT_PATH "${LRT_TEMPLATES_DIRECTORY}/subjects/${SUBJECT}")
	set(JOB_PATH "${LRT_TEMPLATES_DIRECTORY}/jobs/${JOB}")

	if(DEFINED LRT_OVERRIDE_CHAPTERS)
		if(LRT_OVERRIDE_CHAPTERS)
			message(STATUS "Because LRT_OVERRIDE_CHAPTERS=YES, "
				"chapters will be reconfigured"
			)
		else()
			message(STATUS "Because LRT_OVERRIDE_CHAPTERS=NO, "
				"project chapters won't be reconfigured"
			)
		endif()
	else()
		message(STATUS "If you want to reconfigure contents/chapters, "
			"configure with -DLRT_OVERRIDE_CHAPTERS=YES"
		)
		set(LRT_OVERRIDE_CHAPTERS NO)
	endif()

	if (NOT EXISTS ${SUBJECT_PATH})
		message(FATAL_ERROR "Selected subject (${SUBJECT}) "
			"does not exists in ${LRT_TEMPLATES_DIRECTORY}/subjects"
		)
	elseif(NOT EXISTS ${JOB_PATH})
		message(FATAL_ERROR "Selected job (${JOB}) "
			"does not exists in ${LRT_TEMPLATES_DIRECTORY}/jobs"
		)
	endif()

	if(${LRT_OVERRIDE_CHAPTERS})
		message(STATUS "Setting up chapters")
		file(REMOVE_RECURSE "${LRT_CHAPTERS_DIRECTORY}")
		file(COPY "${SUBJECT_PATH}/chapters"
			DESTINATION "${LRT_CONTENTS_DIRECTORY}"
		)
		file(CONFIGURE
			OUTPUT "${CHAPTERS_LOCK}"
			@ONLY CONTENT "@SUBJECT@\n@JOB@"
		)
	else()
		message(STATUS "Setting up chapters - skipped")
	endif()

	message(STATUS "Setting up chapters header")
	configure_file("${SUBJECT_PATH}/chapters.tex"
		"${LRT_CONFIG_DIRECTORY}/chapters.tex"
		COPYONLY
	)

	if (NOT EXISTS "${LRT_CONTENTS_DIRECTORY}/redefines.tex")
		message(STATUS "Setting up contents redefines")
		configure_file("${LRT_TEMPLATES_DIRECTORY}/redefines.tex.in"
			"${LRT_CONTENTS_DIRECTORY}/redefines.tex"
			@ONLY
		)
	else()
		message(STATUS "Setting up contents redefines - skipped (already exists)")
	endif()

	if (NOT EXISTS "${LRT_CONTENTS_DIRECTORY}/bibliography.tex")
		message(STATUS "Setting up contents bibliography")
		file(TOUCH "${LRT_CONTENTS_DIRECTORY}/bibliography.bib")
	else()
		message(STATUS "Setting up contents bibliography - skipped (already exists)")
	endif()

	message(STATUS "Setting up subject defines")
	configure_file(${SUBJECT_PATH}/defines.tex
		${LRT_CONFIG_DIRECTORY}/subjectDefines.tex
		COPYONLY
	)
	message(STATUS "Setting up job defines")
	configure_file(${JOB_PATH}/defines.tex
		${LRT_CONFIG_DIRECTORY}/jobDefines.tex
		COPYONLY
	)
	message(STATUS "Setting up bibliography")
	configure_file(${SUBJECT_PATH}/bibliography.bib
		${LRT_CONFIG_DIRECTORY}/bibliography.bib
		COPYONLY
	)
	file(MAKE_DIRECTORY ${LRT_CONFIG_DIRECTORY}/matter)
	set(MATTER title frontmatter backmatter)
	foreach(matter ${MATTER})
		if(EXISTS ${SUBJECT_PATH}/matter/${matter}.tex)
			message(STATUS "Current subject has custom ${matter}")
			configure_file(${SUBJECT_PATH}/matter/${matter}.tex
				${LRT_CONFIG_DIRECTORY}/matter/${matter}.tex
				COPYONLY
			)
		else()
			message(STATUS "Using default ${matter} (matter/${matter}.tex)")
			configure_file(${LRT_TEMPLATES_DIRECTORY}/matter/${matter}.tex
				${LRT_CONFIG_DIRECTORY}/matter/${matter}.tex
				COPYONLY
			)
		endif()
	endforeach()
	
	set(LRT_OVERRIDE_CHAPTERS OFF CACHE BOOL
		"Set chapters overriding" FORCE
	)
endfunction()
