#!/bin/sh

py_dir=./data_utilities/
case_dir=./test_data/ieee14/scenario_1/
raw1="${case_dir}case.raw"
sup1="${case_dir}case.json"
con1="${case_dir}case.con"
raw2="${case_dir}case.mod.raw"
sup2="${case_dir}case.mod.json"
con2="${case_dir}case.mod.con"
load_mode=1 # max, min, 1, given

# run it
python ${py_dir}modify_data.py "$raw1" "$sup1" "$con1" "$raw2" "$sup2" "$con2" "$load_mode"
