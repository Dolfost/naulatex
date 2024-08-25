find_package(Git REQUIRED)

# get last annotated tag from git
execute_process(
	COMMAND ${GIT_EXECUTABLE} describe --abbrev=0
	OUTPUT_VARIABLE GIT_VERSION_TAG
	WORKING_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}"
	COMMAND_ERROR_IS_FATAL ANY
	OUTPUT_STRIP_TRAILING_WHITESPACE
)

string(REGEX REPLACE 
	"^v([0-9]+\\.[0-9]+(\\.[0-9])?(\\.[0-9])?$)"
	"\\1"
	GIT_VERSION_TAG
	${GIT_VERSION_TAG}
)
