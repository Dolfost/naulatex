find_package(LATEX REQUIRED)
find_package(LatexMk REQUIRED)

set(TEXBINDIR ${CMAKE_CURRENT_BINARY_DIR}/produced)
set(TEXSRCDIR ${CMAKE_CURRENT_SOURCE_DIR})

configure_file(latexmkrc.in
	${CMAKE_CURRENT_BINARY_DIR}/latexmkrc
	@ONLY
)

configure_file(cmakeDefines.tex.in
	${TEXBINDIR}/cmakeDefines.tex
	@ONLY
)

add_custom_target(pdf ALL
	COMMAND ${LATEXMK_EXECUTABLE} document.tex 
	-r ${CMAKE_CURRENT_BINARY_DIR}/latexmkrc
	WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
	BYPRODUCTS document.pdf document.bbl document.idx
	COMMENT "Building pdf with latexmk"
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
return(PROPAGATE TEXSRCDIR TEXBINDIR)
