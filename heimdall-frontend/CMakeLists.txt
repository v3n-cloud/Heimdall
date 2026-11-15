project(heimdall-frontend LANGUAGES CXX)

if(NOT BUILD_FRONTEND)
    return()
endif()

find_package(Qt5 REQUIRED COMPONENTS Widgets)
find_package(ZLIB REQUIRED)

set(CMAKE_AUTOMOC ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(HEIMDALL_FRONTEND_SOURCE_FILES
    source/aboutform.cpp
    source/Alerts.cpp
    source/FirmwareInfo.cpp
    source/main.cpp
    source/mainwindow.cpp
    source/PackageData.cpp
    source/Packaging.cpp)

qt5_wrap_ui(HEIMDALL_FRONTEND_FORMS
    mainwindow.ui
    aboutform.ui)

qt5_add_resources(HEIMDALL_FRONTEND_RESOURCES
    mainwindow.qrc)

add_executable(heimdall-frontend WIN32
    MACOSX_BUNDLE
    ${HEIMDALL_FRONTEND_SOURCE_FILES}
    ${HEIMDALL_FRONTEND_FORMS}
    ${HEIMDALL_FRONTEND_RESOURCES})

target_compile_features(heimdall-frontend PRIVATE cxx_std_11)
target_compile_definitions(heimdall-frontend PRIVATE QT_LARGEFILE_SUPPORT)
target_link_libraries(heimdall-frontend PRIVATE pit Qt5::Widgets ZLIB::ZLIB)

include(LargeFiles)
use_large_files(heimdall-frontend YES)

if(MINGW)
    target_link_options(heimdall-frontend PRIVATE -static-libgcc -static-libstdc++ -static)
endif()

install(TARGETS heimdall-frontend
    RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}"
    LIBRARY DESTINATION "${CMAKE_INSTALL_LIBDIR}")
