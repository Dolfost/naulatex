cmake_minimum_required(VERSION 3.25)

list(APPEND CMAKE_MODULE_PATH 
	"${CMAKE_CURRENT_LIST_DIR}/cmake"
)

include(version)

project(naulatex
	VERSION ${GIT_VERSION_TAG}
	HOMEPAGE_URL https://github.com/Dolfost/naulatex
	LANGUAGES NONE
)

add_subdirectory(src)

set(NAULATEX_SUBJECT matstat
	CACHE STRING "Subject template name"
)
set(NAULATEX_JOB lab
	CACHE STRING "Job template name"
)

option(NAULATEX_OVERRIDE_CHAPTERS
	"Override contents/chapters"
	NO
)

naulatex_setup(${NAULATEX_SUBJECT} ${NAULATEX_JOB})
