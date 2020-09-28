#!/bin/sh

py_dir=./data_utilities/
case_dir=./data/ieee14/scenario_1/
raw="${case_dir}case.raw"
sup="${case_dir}case.json"
con="${case_dir}case.con"

# run it
python ${py_dir}check_data.py "$raw" "$sup" "$con"
