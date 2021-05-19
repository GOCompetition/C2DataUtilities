#!/bin/sh

# C2DataUtilities test data
case_dir=./test_data/ieee14/scenario_1/
#case_dir=./test_data/ieee14/scenario_2/
#case_dir=./test_data/ieee14/scenario_3/
#case_dir=./test_data/ieee14/scenario_4/
#case_dir=./test_data/ieee14/scenario_5/
#case_dir=./test_data/ieee14/scenario_6/
#case_dir=./test_data/ieee14/scenario_7/
#case_dir=./test_data/ieee14/scenario_8/
#case_dir=./test_data/ieee14/scenario_9/
#case_dir=./test_data/ieee14/scenario_10/
#case_dir=./test_data/ieee14/scenario_11/
#case_dir=./test_data/ieee14/scenario_12/
#case_dir=./test_data/ieee14/scenario_13/ # test transformer impedance correction table check/scrub

#sol_dir=./tmpsol/sol7/

# set options
use_orig=1
use_scrub=0
use_mod=0
strict_names=1
refresh_data=1
check_data=1
scrub_data=0
modify_data=0
check_data_again=1
make_new_sol=0
copy_sol=0
eval_sol=0
do_submission=0
eval_submission=0
division=1
num_proc=1

py_dir=./data_utilities/
work_dir=./tmp/
# original data
raw1="${work_dir}/case.orig.raw"
sup1="${work_dir}/case.orig.json"
con1="${work_dir}/case.orig.con"
# scrubbed data
raw2="${work_dir}/case.scrubbed.raw"
sup2="${work_dir}/case.scrubbed.json"
con2="${work_dir}/case.scrubbed.con"
# modified data
raw3="${work_dir}/case.mod.raw"
sup3="${work_dir}/case.mod.json"
con3="${work_dir}/case.mod.con"
# data to use in solution and evaluation
raw="${work_dir}/case.raw"
sup="${work_dir}/case.json"
con="${work_dir}/case.con"

echo "case: ${case_dir}"

if [ ! -d "$work_dir" ] 
then
    mkdir "$work_dir"
fi

# clean up the directory - todo just remove everything, right?
rm $work_dir/*.eval.log

# copy to here
if [ $refresh_data -gt 0 ]
then
    rm -rf $work_dir/*
    #rm $work_dir/*.raw
    #rm $work_dir/*.json
    #rm $work_dir/*.con
    if [ $strict_names -gt 0 ]
    then
	echo "find case: strict names"
	cp "${case_dir}case.raw" "$raw1"
	cp "${case_dir}case.json" "$sup1"
	cp "${case_dir}case.con" "$con1"
    else
	echo "find case: arbitrary names"
	cp "$case_dir"/*.raw "$work_dir"
	cp "$case_dir"/*.json "$work_dir"
	cp "$case_dir"/*.con "$work_dir"
        # remove the excess stuff
	rm $work_dir/*-w.raw
	rm $work_dir/*_clean.raw
	rm $work_dir/*_clean.json
	rm $work_dir/*_clean.con
	for i in $work_dir*.raw; do
	    [ -f "$i" ] || break
	    #echo "$i"
            cp "$i" "$raw1"
	done
	for i in "$work_dir"*.json; do
	    [ -f "$i" ] || break
	    #echo "$i"
            cp "$i" "$sup1"
	done
	for i in "$work_dir"*.con; do
	    [ -f "$i" ] || break
	    #echo "$i"
            cp "$i" "$con1"
	done
    fi
fi

# check data
if [ $check_data -gt 0 ]
then
    echo "check data"
    python ${py_dir}check_data.py "$raw1" "$sup1" "$con1"
else
    echo "skip check data"
fi

# scrub data
if [ $scrub_data -gt 0 ]
then
    echo "scrub data"
    python ${py_dir}scrub_data.py "$raw1" "$sup1" "$con1" "$raw2" "$sup2" "$con2"
else
    echo "skip scrub data"
fi

# modify data
if [ $modify_data -gt 0 ]
then
    echo "modify data"
    python ${py_dir}modify_data.py "$raw1" "$sup1" "$con1" "$raw3" "$sup3" "$con3"
else
    echo "skip modify data"
fi

# which data to use
if [ $use_orig -gt 0 ]
then
    echo "using original data"
    cp "$raw1" "$raw"
    cp "$sup1" "$sup"
    cp "$con1" "$con"
fi
if [ $use_scrub -gt 0 ]
then
    echo "using scrubbed data"
    cp "$raw2" "$raw"
    cp "$sup2" "$sup"
    cp "$con2" "$con"
fi
if [ $use_mod -gt 0 ]
then
    echo "using modified data"
    cp "$raw3" "$raw"
    cp "$sup3" "$sup"
    cp "$con3" "$con"
fi

# check data again
if [ $check_data_again -gt 0 ]
then
    echo "check data again"
    python ${py_dir}check_data.py "$raw" "$sup" "$con"
else
    echo "skip check data again"
fi

# construct infeasibility solution
if [ $make_new_sol -gt 0 ]
then
    echo "construct new infeasibility solution"
    rm ${work_dir}/solution_*.txt
    python ${py_dir}construct_infeasibility_solution.py "$raw" "$sup" "$con" "$work_dir"
else
    echo "skip construct new infeasibility solution"
fi

# copy stored solution
if [ $copy_sol -gt 0 ]
then
    echo "copy stored solution"
    echo "stored solution directory: ${sol_dir}"
    cp ${sol_dir}/solution*.txt $work_dir
else
    echo "skip copy stored solution"
fi

# evaluate infeasibility solution
if [ $eval_sol -gt 0 ]
then
    echo "evaluate solution"
    if [ $num_proc -gt 1 ]
    then
	echo "using mpi, np=$num_proc"
	mpirun -np $num_proc python ${py_dir}evaluation.py $division "$work_dir" "$work_dir"
    else
	echo "using serial method"
	python ${py_dir}evaluation.py $division "$work_dir" "$work_dir"
    fi
else
    echo "skip evaluate solution"
fi

# do submission with infeasibility solution
if [ $do_submission -gt 0 ]
then
    echo "do submission with infeasibility solution"
    rm ./solution_*.txt
    reserved=reserved
    timelimit=300
    network=network
    python MyPython1.py "$con" "$sup" "$raw" $reserved $timelimit $division $network
    python MyPython2.py "$con" "$sup" "$raw" $reserved $timelimit $division $network
else
    echo "skip submission with infeasibility solution"
fi

# evaluate infeasibility solution
if [ $eval_submission -gt 0 ]
then
    echo "evaluate submission with infeasibility solution"
    if [ $num_proc -gt 1 ]
    then
	echo "using mpi, np=$num_proc"
	mpirun -np $num_proc python ${py_dir}evaluation.py $division "$work_dir" ./
    else
	echo "using serial method"
	python ${py_dir}evaluation.py $division "$work_dir" ./
    fi
else
    echo "skip evaluate submission with infeasibility solution"
fi


