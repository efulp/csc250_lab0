# simple makefile for clang-tidy, clang-format, and compiling
#
# Nirre Pluf 
# 9/20/2020
# CSC 250 Lab 0

SOURCE = read_file.c

all: format tidy
	gcc -ansi -pedantic -Wall $(SOURCE)

format: $(SOURCE) 
	clang-format -style="{BasedOnStyle: Google, Language: Cpp, IndentWidth: 4, SpaceBeforeParens: false, AllowShortIfStatementsOnASingleLine: true, SpaceBeforeCpp11BracedList: false, BreakBeforeBraces: Stroustrup}" $(SOURCE) | diff $(SOURCE) -

tidy: $(SOURCE)
	clang-tidy -checks='*' $(SOURCE) -- -std=c99


