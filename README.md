# Single header library starter
This is a project starter for creating your own single C++ header library. It uses CMake as a build tool, Catch2 for unit testing, Quom for automatic single header generation, clang-format for code formatting, and provides a basic Github workflow to automate testing and verification of your library.

Based on my project 'alex': https://github.com/lruijsink/alex

# Setup
Once you've picked a name for your project, change the following:
1. Name of your CMake project in `./CMakeLists.txt`
2. `LIBRARY_NAME` in `script/generate-header.sh`
3. Update this README
4. Write your library!

You can write your library as separate header files, Quom will combine them for you. This requires that there is a single 'main' header file which includes the rest of your library's source files. The main header file as well as its directory should match `LIBRARY_NAME` from step 2, so Quom knows which file to look for. In the example `LIBRARY_NAME` is `mylib` and the main header file is located at `include/mylib/mylib.hpp`

Optionally, but reccommended, you can add `script/hook.sh` to your git pre-commit hooks, to automatically format and update the single header include when committing new changes.

# Contributing
When submitting contributions, make sure:
- All changes have been formatted using `clang-format`
- The single include header is updated with Quom, and formatted

This process can be automated by adding `script/hook.sh` to your pre-commit hooks. This script will run Quom to generate the
single include header and run `clang-format` on all staged changes.

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
