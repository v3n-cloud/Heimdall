# Heimdall

Heimdall is a cross-platform open-source tool suite used to flash firmware (aka ROMs) onto Samsung mobile devices.

## Supported Platforms

Officially, AMD64/x86-64 (64-bit) or x86 (32-bit) computers running:

- Linux
- macOS
- Windows (XP, Vista, 7 etc.)

However, several third-parties have reported success running Heimdall on ARM chipsets (in particular Raspberry Pi), as well as additional operating systems such as FreeBSD.

## How does Heimdall work?

Heimdall connects to a mobile device over USB and interacts with low-level software running on the device, known as Loke. Loke and Heimdall communicate via the custom Samsung-developed protocol typically referred to as the 'Odin 3 protocol'.

USB communication in Heimdall is handled by the popular open-source USB library, [libusb](http://libusb.info).

## Free & Open Source

Heimdall is both free and open source. It is licensed under the MIT license (see LICENSE).

## Building

### Requirements

- CMake 3.13 or newer
- A C++11-capable compiler
- libusb 1.0 development package
- Qt5 development package only if you want to build the GUI frontend

### Configure and build

```bash
cmake -S . -B build
cmake --build build
```

To build only the CLI tools without the GUI frontend:

```bash
cmake -S . -B build -DBUILD_FRONTEND=OFF
cmake --build build
```

If Qt is installed in a non-standard location, point CMake to it:

```bash
cmake -S . -B build -DCMAKE_PREFIX_PATH=/path/to/qt
```

## Documentation

For more details about how to compile and install Heimdall please refer to the appropriate platform specific README:

- Linux/README ([online](https://raw.githubusercontent.com/Benjamin-Dobell/Heimdall/master/Linux/README))
- OSX/README.txt ([online](https://raw.githubusercontent.com/Benjamin-Dobell/Heimdall/master/OSX/README.txt))
- Win32/README.txt ([online](https://raw.githubusercontent.com/Benjamin-Dobell/Heimdall/master/Win32/README.txt))
