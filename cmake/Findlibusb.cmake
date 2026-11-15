find_package(PkgConfig QUIET)
if(PkgConfig_FOUND)
    pkg_check_modules(PC_LIBUSB QUIET libusb-1.0)
endif()

find_path(LIBUSB_INCLUDE_DIR
    NAMES libusb.h
    HINTS ${PC_LIBUSB_INCLUDE_DIRS}
    PATH_SUFFIXES libusb-1.0)

find_library(LIBUSB_LIBRARY
    NAMES usb-1.0 usb
    HINTS ${PC_LIBUSB_LIBRARY_DIRS})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(libusb
    REQUIRED_VARS LIBUSB_LIBRARY LIBUSB_INCLUDE_DIR)

if(libusb_FOUND)
    set(LIBUSB_INCLUDE_DIRS "${LIBUSB_INCLUDE_DIR}")
    set(LIBUSB_LIBRARIES "${LIBUSB_LIBRARY}")

    if(NOT TARGET LibUSB::LibUSB)
        add_library(LibUSB::LibUSB UNKNOWN IMPORTED)
        set_target_properties(LibUSB::LibUSB PROPERTIES
            IMPORTED_LOCATION "${LIBUSB_LIBRARY}"
            INTERFACE_INCLUDE_DIRECTORIES "${LIBUSB_INCLUDE_DIR}")
    endif()
endif()

mark_as_advanced(LIBUSB_INCLUDE_DIR LIBUSB_LIBRARY)
