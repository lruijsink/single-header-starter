# Single header C++ library starter
Single header C++ libraries are among the easiest way to share your work, requiring no installation or dependencies on the part of your users. This starter aims to make it simple to set up a single header library project of your own and to provide the most important workflow tools.

Features of the starter:
- Single header generation using Quom (https://github.com/Viatorus/quom)
- Build testing with GCC and Clang
- Unit testing with Catch2 (https://github.com/catchorg/Catch2)
- Enforcing correct `clang-format` usage and single header generation
- GitHub Actions to automate all of the above and protect your `master` branch

This starter is geared towards a Linux environment.

# Setup
Once you've picked a name for your project, do the following:
1. Name your CMake project in `./CMakeLists.txt`
2. Update `LIBRARY_SHORT_NAME` in `script/generate-header.sh`
3. Update README
4. Pick a LICENSE, no need to keep the one included in the starter
5. Optional: set up branch protection rules
6. Write your library!

Single header generation requires that there is a single 'main' header file, which includes the rest of your source files. This main header as well as its directory should match `LIBRARY_SHORT_NAME` from step 2, so Quom knows which file to look for. For example, if `LIBRARY_SHORT_NAME` is `mylib` then the main header will be `include/mylib/mylib.hpp`

It is recommended that you add `script/hook.sh` to your git pre-commit hooks. This automatically formats and updates the single header when committing new changes.

It is also recommended to protect your `master` branch, using GitHub's branch protection rules. To do this, go to your repository -> Settings -> Branches -> Branch protection rules -> Add rule and set up a rule as follows:

- Branch name pattern: `master`
- Require status checks to pass before merging:
  - Require branches to be up to date before merging: ON
  - Enable all status checks (`build ...` and `verify`)

# Contributing
When submitting contributions, make sure:
- All changes have been formatted using `clang-format`
- The single header is updated with Quom, and formatted

This process can be automated by adding `script/hook.sh` to your pre-commit hooks. This script will run Quom to generate the single header and run `clang-format` on all staged changes.

# Build + test locally
To build the project the following dependencies are required:
- CMake v3.1.0
- Python 3.6+ with PIP
- Catch2: unit testing library (https://github.com/catchorg/Catch2)
- Quom: single header generator (https://github.com/Viatorus/quom)

Use your CMake setup of choice or use the `script/build.sh` script, which outputs to the `build` folder.

`build.sh` takes two optional arguments: `compiler` and `target`, which default to `g++` and `Release`:
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
