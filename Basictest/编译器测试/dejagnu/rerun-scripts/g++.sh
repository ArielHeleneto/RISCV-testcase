#!/bin/bash
tests=("patchable_function_entry-decl" "patchable_function_entry-default" "patchable_function_entry-definition" "spec-barrier-1")


rm -rf ~/log/g++
mkdir -p ~/log/g++

runtest --outdir ~/log/g++ -v --tool g++ dg.exp=pr99305.C
mv ~/log/g++/g++.log ~/log/g++/pr99305.log
mv ~/log/g++/g++.sum ~/log/g++/pr99305.sum

for test in "${tests[@]}"
do
    runtest --outdir ~/log/g++ -v --tool g++ dg.exp=$test.c
    mv ~/log/g++/g++.log ~/log/g++/${test%}.log
    mv ~/log/g++/g++.sum ~/log/g++/${test%}.sum
done