#!/bin/bash
tests=("pr45636" "pr95690")

rm -rf ~/log/gfortran
mkdir -p ~/log/gfortran
runtest --outdir ~/log/gfortran -v --tool gfortran ieee.exp=ieee_6.f90
mv ~/log/gfortran/gfortran.log ~/log/gfortran/ieee_6.log
mv ~/log/gfortran/gfortran.sum ~/log/gfortran/ieee_6.sum

for test in "${tests[@]}"
do
    runtest --outdir ~/log/gfortran -v --tool gfortran dg.exp=$test.f90
    mv ~/log/gfortran/gfortran.log ~/log/gfortran/${test%}.log
    mv ~/log/gfortran/gfortran.sum ~/log/gfortran/${test%}.sum
done