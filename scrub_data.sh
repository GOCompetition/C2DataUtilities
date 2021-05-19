#!/bin/sh

py_dir=./data_utilities/
case_dir=./data/ieee14/scenario_1/
raw1="${case_dir}case.raw"
sup1="${case_dir}case.json"
con1="${case_dir}case.con"
raw2="${case_dir}case.scrubbed.raw"
sup2="${case_dir}case.scrubbed.json"
con2="${case_dir}case.scrubbed.con"

# run it
python ${py_dir}scrub_data.py "$raw1" "$sup1" "$con1" "$raw2" "$sup2" "$con2"
