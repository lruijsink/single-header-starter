# Single header library starter
This is a project starter for creating your own single header library. It uses CMake as a build tool, Catch2 for unit testing, Quom for automatic single header generation, clang-format for code formatting, and provides a basic Github workflow to automate testing and verification of your library.

# Setup
Once you've picked a name for your project, change the following:
- Name of your CMake project in `./CMakeLists.txt`
- `LIBRARY_NAME` in `script/generate-header.sh`
- Update this README
- Write your library!

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
