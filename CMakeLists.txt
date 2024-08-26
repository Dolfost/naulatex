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

naulatex_setup(matstat lab)
