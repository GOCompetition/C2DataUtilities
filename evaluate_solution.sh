#!/bin/sh

py_dir=./data_utilities/
case_dir=./data/ieee14/scenario_1/
sol_dir=./data/ieee14/scenario_1/
raw="${case_dir}case.raw"
sup="${case_dir}case.json"
con="${case_dir}case.con"
division=4

# run it
python ${py_dir}evaluation.py $division "$case_dir" "$sol_dir"
#mpirun -np 2 python ${py_dir}evaluation.py
