cmake_minimum_required(VERSION 3.8)
project(logger LANGUAGES C CXX)

add_compile_options(-O2 -Wall -std=c99 -D _GNU_SOURCE)
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,--gc-sections -s")

aux_source_directory(${PROJECT_SOURCE_DIR}/src SRCS)

include_directories(${PROJECT_SOURCE_DIR}/inc)

add_library(${PROJECT_NAME} SHARED ${SRCS})

message(STATUS "Building dynamic library logger with sources: ${SRCS}")

install(TARGETS ${PROJECT_NAME} LIBRARY DESTINATION ${PROJECT_SOURCE_DIR}/log/lib)
install(DIRECTORY inc/ DESTINATION ${PROJECT_SOURCE_DIR}/log/include)