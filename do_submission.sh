#!/bin/sh

case_dir=./data/ieee14/scenario_1/
sol_dir=./data/ieee14/scenario_1/
raw="${case_dir}case.raw"
sup="${case_dir}case.json"
con="${case_dir}case.con"
reserved=reserved
timelimit=300
division=1
network=network

# run it
python MyPython1.py $con $sup $raw $reserved $timelimit $division $network
python MyPython2.py $con $sup $raw $reserved $timelimit $division $network
