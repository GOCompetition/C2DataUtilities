#!/bin/sh

py_dir=./py/
case_dir=./data/ieee14/scenario_1/
sol_dir=./data/ieee14/scenario_1/
raw="${case_dir}case.raw"
sup="${case_dir}case.json"
con="${case_dir}case.con"

# run it
python ${py_dir}construct_infeasibility_solution.py "$raw" "$sup" "$con" "$sol_dir"
