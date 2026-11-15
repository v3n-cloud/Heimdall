project(heimdall LANGUAGES CXX)

find_package(libusb REQUIRED)

set(HEIMDALL_SOURCE_FILES
    source/Arguments.cpp
    source/BridgeManager.cpp
    source/ClosePcScreenAction.cpp
    source/DetectAction.cpp
    source/DownloadPitAction.cpp
    source/FlashAction.cpp
    source/HelpAction.cpp
    source/InfoAction.cpp
    source/Interface.cpp
    source/main.cpp
    source/PrintPitAction.cpp
    source/Utility.cpp
    source/VersionAction.cpp)

add_executable(heimdall ${HEIMDALL_SOURCE_FILES})
target_compile_features(heimdall PRIVATE cxx_std_11)
target_link_libraries(heimdall PRIVATE pit LibUSB::LibUSB)

if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
    target_compile_definitions(heimdall PRIVATE OS_LINUX)
endif()

include(LargeFiles)
use_large_files(heimdall YES)

if(MINGW)
    target_link_options(heimdall PRIVATE -static-libgcc -static-libstdc++ -static)
endif()

install(TARGETS heimdall
    RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}"
    LIBRARY DESTINATION "${CMAKE_INSTALL_LIBDIR}")
