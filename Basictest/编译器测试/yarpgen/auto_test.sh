#!/bin/sh

if ! [ -e failed ]
then
	mkdir failed
fi

failed=0
total=0

print_summary () {
	echo "Total $total, failed: $failed"
}

stoptest() {
	print_summary
	exit
}

trap stoptest 1 2

for i in `seq 1 $1`
do
	./yarpgen > /dev/null
	cat init.h func.cpp driver.cpp > random.cpp
	options=(O0 O1 O2 O3 Os)
	compilers=(gcc clang)
	result=()
	for compiler in ${compilers[*]}
	do
		for option in ${options[*]}
		do
			$compiler -$option random.cpp -o out 2>/dev/null > /dev/null
			result+=(`./out`)
		done
	done

	s=${result[0]}
	for j in ${result[*]}
	do
		if [ $j != $s ]
		then
			echo "Output mismatch"
			failed=$((failed + 1))
			print_summary
			cp random.cpp failed/`sha256sum random.cpp | head -c 40`.cpp
			break
		fi
	done
	total=$((total + 1))
	print_summary
done
