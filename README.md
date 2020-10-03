# Single header C++ library starter
Single header C++ libraries are among the easiest way to share your work, requiring no installation or dependencies on the part of your users. This starter aims to make it simple to set up a single header library project of your own and to provide the most important workflow tools.

Features of the starter:
- Automatic single header generation using Quom (https://github.com/Viatorus/quom)
- Automatic build testing with GCC and Clang
- Unit testing with Catch2 (https://github.com/catchorg/Catch2)
- Enforces correct `clang-format` usage and single header generation

This starter is geared towards a Linux environment.

# Setup
Once you've picked a name for your project, change the following:
1. Name of your CMake project in `./CMakeLists.txt`
2. `LIBRARY_SHORT_NAME` in `script/generate-header.sh`
3. Update README
4. Pick a LICENSE, no need to keep the one included in the starter
5. Write your library!

Single header generation requires that there is a single 'main' header file, which includes the rest of your source files. This main header as well as its directory should match `LIBRARY_SHORT_NAME` from step 2, so Quom knows which file to look for. For example, if `LIBRARY_SHORT_NAME` is `mylib` then the main header will be `include/mylib/mylib.hpp`

It is recommended that you add `script/hook.sh` to your git pre-commit hooks. This automatically formats and updates the single header when committing new changes.

# Contributing
When submitting contributions, make sure:
- All changes have been formatted using `clang-format`
- The single include header is updated with Quom, and formatted

This process can be automated by adding `script/hook.sh` to your pre-commit hooks. This script will run Quom to generate the single include header and run `clang-format` on all staged changes.

# Dependencies
- CMake v3.1.0
- Python 3.6+ with PIP
- Catch2: unit testing library (https://github.com/catchorg/Catch2)
- Quom: single include header generator (https://github.com/Viatorus/quom)

# Build + test locally
Use your CMake setup of choice, or run the `script/build.sh` script, this will build the project in the `build` folder.

`build.sh` takes two optional arguments: `compiler` (default: g++) and `target` (default: Release), as follows:
```
script/build.sh                 # build with GCC in Release mode
script/build.sh clang++ Debug   # build with Clang in Debug mode
```

# Installing dependencies
CMake
```
sudo apt-get install cmake
```

Python 3.6+ with PIP
```
sudo apt-get install python3.6
sudo apt-get install python3-pip
```

Catch2
```
git clone https://github.com/catchorg/Catch2.git
cd Catch2
cmake -Bbuild -H. -DBUILD_TESTING=OFF
sudo cmake --build build/ --target install
```

Quom
```
pip3 install quom
```
