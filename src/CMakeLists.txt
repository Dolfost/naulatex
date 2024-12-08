list(APPEND CMAKE_MODULE_PATH 
	"${CMAKE_CURRENT_LIST_DIR}/cmake"
)

find_package(LATEX REQUIRED)
find_package(LatexMk REQUIRED)
find_package(TexLogFilter)

set(LRT_CONFIG_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/config")
set(LRT_TEMPLATES_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/templates")
set(LRT_CONTENTS_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/contents")
set(LRT_RESOURCES_DIRECTORY "${LRT_TEMPLATES_DIRECTORY}/resources")
set(LRT_CHAPTERS_DIRECTORY "${LRT_CONTENTS_DIRECTORY}/chapters")

configure_file("${LRT_TEMPLATES_DIRECTORY}/latexmkrc.in"
	"${CMAKE_CURRENT_BINARY_DIR}/latexmkrc"
	@ONLY
)

configure_file("${LRT_TEMPLATES_DIRECTORY}/cmakeDefines.tex.in"
	"${LRT_CONFIG_DIRECTORY}/cmakeDefines.tex"
	@ONLY
)

set(LATEXMK_OPTIONS "-verbose")
set(TEXLOGFILTER_OPTIONS "--ref --filename")

set(LOG_COMMENT "Trimming logs")
if(NOT TEXLOGFILTER_FOUND)
	add_custom_target(log
		COMMAND ${CMAKE_COMMAND} -E echo 
			"texloganalyser were not found."
		COMMENT ${LOG_COMMENT}
	)
else()
	add_custom_target(log
		COMMAND ${TEXLOGFILTER_EXECUTABLE}
			${CMAKE_CURRENT_BINARY_DIR}/document.log 
			${TEXLOGFILTER_OPTIONS}
		COMMENT ${LOG_COMMENT}
	)
	set(SILENT_OPTIONS "-silent")
endif()

add_custom_target(pdf ALL
	COMMAND ${LATEXMK_EXECUTABLE} document.tex 
		-r "${CMAKE_CURRENT_BINARY_DIR}/latexmkrc"
		"${SILENT_OPTIONS}" "${LATEXMK_OPTIONS}"
	WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
	BYPRODUCTS "${CMAKE_CURRENT_BINARY_DIR}/out" "${CMAKE_CURRENT_BINARY_DIR}/aux"
	COMMENT "Building pdf with latexmk"
)

configure_file("${LRT_TEMPLATES_DIRECTORY}/continuous.sh.in"
	"${CMAKE_BINARY_DIR}/continious"
	FILE_PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE
	@ONLY
)

add_custom_target(pdf_clean 
	COMMAND ${LATEXMK_EXECUTABLE} -c document.tex
	-r ${CMAKE_CURRENT_BINARY_DIR}/latexmkrc
	WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
	COMMENT "Cleaning aluxary files"
)

list(APPEND CMAKE_MODULE_PATH 
	"${CMAKE_CURRENT_LIST_DIR}/cmake"
)

include(setup)
return(PROPAGATE 
	LRT_TEMPLATES_DIRECTORY 
	LRT_CONFIG_DIRECTORY
	LRT_CONTENTS_DIRECTORY
	LRT_RESOURCES_DIRECTORY
	LRT_CHPATERS_DIRECTORY
)
