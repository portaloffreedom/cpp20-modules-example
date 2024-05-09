cmake_minimum_required(VERSION 3.27)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
project(cpp20-modules-example CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_SCAN_FOR_MODULES ON)
if (CMAKE_VERSION LESS 3.28)
	#set(CMAKE_EXPERIMENTAL_CXX_MODULE_CMAKE_API aa1f7df0-828a-4fcd-9afc-2dc80491aca7)
	set(CMAKE_EXPERIMENTAL_CXX_MODULE_DYNDEP 1)
endif()

# Enable compiler specific stuff
if (CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
	if (CMAKE_CXX_COMPILER_VERSION LESS 16 )
		message(FATAL_ERROR "Clang supported only from version 16")
	elseif (CMAKE_CXX_COMPILER_VERSION LESS 18)
		# Default to C++ extensions being off. Clang16's modules support have trouble
		# with extensions right now and it is not required for any other compiler
		set(CMAKE_CXX_EXTENSIONS OFF)
	endif()
elseif (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
	if (CMAKE_CXX_COMPILER_VERSION LESS 14 )
		message(FATAL_ERROR "GCC Version < 14 not supported")
	endif()
    # SET(SYSTEM_HEADER "${CMAKE_CURRENT_BINARY_DIR}/gcm.cache/./usr/include/c++/${CMAKE_CXX_COMPILER_VERSION}/iostream.gcm")
endif()

# add_custom_target(system_headers
#   BYPRODUCTS "${SYSTEM_HEADER}"
#   COMMAND g++ -std=c++20 -fmodules-ts -c -x c++-system-header iostream
# )

add_executable(main main.cpp)
target_sources(main PUBLIC
  FILE_SET cxx_modules TYPE CXX_MODULES
  BASE_DIRS
    ${PROJECT_SOURCE_DIR}
  FILES
    M2.cpp
    M3.cpp
)

add_library(person STATIC)
# target_compile_definitions(person PUBLIC HEADER_STDLIB=1)
target_sources(person PUBLIC
  FILE_SET cxx_modules TYPE CXX_MODULES
  BASE_DIRS
    ${PROJECT_SOURCE_DIR}
  FILES
    person/module.cppm
    person/person.cpp
    # person/person_function.cpp
)

# add_dependencies(person system_headers)

add_executable(person_main)
# target_compile_definitions(person_main PUBLIC HEADER_STDLIB=1)
target_link_libraries(person_main person)

target_sources(person_main PRIVATE
  main_person.cpp
)

