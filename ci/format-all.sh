#!/bin/bash

find . -iname *.h -o \
       -iname *.hpp -o \
       -iname *.c -o \
       -iname *.cpp \
| xargs clang-format -i
