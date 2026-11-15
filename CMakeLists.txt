cmake_minimum_required(VERSION 3.13)

project(Heimdall LANGUAGES CXX)

include(GNUInstallDirs)
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")

option(BUILD_FRONTEND "Build the Qt GUI frontend" ON)
option(DISABLE_FRONTEND "Deprecated: disable the Qt GUI frontend" OFF)
if(DISABLE_FRONTEND)
    set(BUILD_FRONTEND OFF)
endif()

add_subdirectory(libpit)
add_subdirectory(heimdall)

if(BUILD_FRONTEND)
    add_subdirectory(heimdall-frontend)
    add_dependencies(heimdall-frontend heimdall)
endif()
