#!/bin/bash
tests=("patchable_function_entry-decl" "patchable_function_entry-default" "patchable_function_entry-definition" "spec-barrier-1")

rm -rf ~/log/gcc
mkdir -p ~/log/gcc

runtest --outdir ~/log/gcc -v --tool gcc autoprefetch.exp=get-edge-prob-non-init.c
mv ~/log/gcc/gcc.log ~/log/gcc/get-edge-prob-non-init.log
mv ~/log/gcc/gcc.sum ~/log/gcc/get-edge-prob-non-init.sum
runtest --outdir ~/log/gcc -v --tool gcc debug.exp=inline5.c
mv ~/log/gcc/gcc.log ~/log/gcc/inline5.log
mv ~/log/gcc/gcc.sum ~/log/gcc/inline5.sum

for test in "${tests[@]}"
do
    runtest --outdir ~/log/gcc -v --tool gcc dg.exp=$test.c
    mv ~/log/gcc/gcc.log ~/log/gcc/${test%}.log
    mv ~/log/gcc/gcc.sum ~/log/gcc/${test%}.sum
done