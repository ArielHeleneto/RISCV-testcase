#!/bin/sh

RED=$(printf "\033[31m")
GREEN=$(printf "\033[32m")
YELLOW=$(printf "\033[33m")
NONE=$(printf "\033[39m")
CC=gcc

total=0
passed=0
failed=0

summary() {
	echo "Total: $total Passed: $passed Failed: $failed"
	exit
}

trap summary 2 1

for src in `find . -type f -path *.c`
do
	if ! $CC $src -c -o $src.o 2>$src.build.log > $src.build.log
	then
		echo "$RED[CE]$NONE $src"
		failed=$(($failed + 1))
	else
		echo "$GREEN[AC]$NONE $src"
		rm $src.build.log
		rm $src.o
		passed=$(($passed + 1))
	fi
	total=$(($total + 1))
done
summary
