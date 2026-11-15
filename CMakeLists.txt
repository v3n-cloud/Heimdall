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

if(BUILD_FRONTEND)
    find_package(Qt5 QUIET COMPONENTS Widgets)
    if(NOT Qt5_FOUND)
        message(WARNING "Qt5 was not found; the Heimdall GUI frontend will be disabled. Set BUILD_FRONTEND=OFF to silence this warning or install Qt5 development packages.")
        set(BUILD_FRONTEND OFF)
    endif()
endif()

add_subdirectory(libpit)
add_subdirectory(heimdall)

if(BUILD_FRONTEND)
    add_subdirectory(heimdall-frontend)
    add_dependencies(heimdall-frontend heimdall)
endif()
