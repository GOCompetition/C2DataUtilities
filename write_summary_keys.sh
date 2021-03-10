#!/bin/sh

# syntax:
# $ source write_summary_keys.sh <out_file_name>

py_dir=./data_utilities/
python ${py_dir}write_summary_keys.py "$1"
