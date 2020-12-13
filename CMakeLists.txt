cmake_minimum_required(VERSION 3.1.0)
project(mylib)

enable_testing()

find_package(Catch2 REQUIRED)
include(CTest)
include(Catch)

include_directories(include)
include_directories(/usr/local/include)
add_subdirectory(test)
