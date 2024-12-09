cmake_minimum_required(VERSION 3.25)

list(APPEND CMAKE_MODULE_PATH 
	"${CMAKE_CURRENT_LIST_DIR}/cmake"
)

include(version)

project(latex_report_template
	VERSION ${GIT_VERSION_TAG}
	HOMEPAGE_URL https://github.com/Dolfost/latex-report-template
	LANGUAGES NONE
)

add_subdirectory(src)

set(LRT_SUBJECT matstat
	CACHE STRING "Subject template name"
)
set(LRT_JOB lab
	CACHE STRING "Job template name"
)
option(LRT_OVERRIDE_CHAPTERS
	"Override contents/chapters"
	NO
)

lrt_setup(${LRT_SUBJECT} ${LRT_JOB})
