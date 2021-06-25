#!/bin/sh

# syntax:
# $ ./work.sh <flags>
#
# e.g.
# $ ./work.sh -c ./test_data/ieee14/scenario_1/ -s ./tmpsol/sol1/
#
# c: case_dir - if present copy case from there
# s: sol_dir - if present copy a solution from there
# r scrub_data
# m: modify_mode - if present, do modify
# i: use prior operating point solver to make a new solution
# p: do a platform submission of the prior operating point solver to make a new solution
# e: evaluate solution
# d: division
# n: num_proc
# w: work directory

# default values of flag arguments
case_dir=./test_data/ieee14/scenario_1
sol_dir=
scrub_data=0
modify_load_mode=
modify_data=0
make_new_sol=0
copy_sol=0 # need to edit this by hand for now
do_submission=0
eval_sol=0
division=1
num_proc=1
work_dir=./tmp/

print_usage() {
  echo "Usage:"
  echo "$ ./work.sh <flags>"
  echo ""
  echo "flags:"
  echo "-h : help"
  echo "-c <case_dir> : if present copy case from there"
  echo "-s <sol_dir> : if present copy a solution from there"
  echo "-r : scrub_data"
  echo "-l <modify_load_mode> : if present, do modify with this mode"
  echo "-i : use prior operating point solver to make a new solution"
  echo "-p : do a platform submission of the prior operating point solver to make a new solution"
  echo "-e : evaluate solution"
  echo "-d <division> : division = 1, 2, 3, 4"
  echo "-n <num_proc> : number of processes in eval, > 1 requires MPI"
  echo "-w <work_dir> : work directory. data, solutions, output files land here"
}

while getopts 'hc:s:rl:iednw' flag; do
  case ${flag} in
    h) print_usage
       exit ;;
    c) case_dir="${OPTARG}" ;;
    s) sol_dir="${OPTARG}" ;;
    r) scrub_data=1 ;;
    l) modify_load_mode="${OPTARG}" ;;
    i) make_new_sol=1 ;;
    p) do_submission=1 ;;
    e) eval_sol=1 ;;
    d) division=${OPTARG} ;;
    n) num_proc=${OPTARG} ;;
    w) work_dir=${OPTARG} ;;
    *) print_usage
       exit 1 ;;
  esac
done

# case_dir=$1 # c
# sol_dir=$2 # s

# # set options
# scrub_data=1
# modify_data=1
# make_new_sol=0
# copy_sol=0
# eval_sol=0
# division=1
# num_proc=1

# if modify then use modify
# if scrub and not modify then use scrub
# if not scrub then use orig
# need to scrub if modifying 
# need to check again if scrubbing or modifying
strict_names=1
refresh_data=1

if [ ! -z $modify_load_mode ]
then
    scrub_data=1
    modify_data=1
fi

if [ $do_submission -gt 0 ]
then
    make_new_sol=0
    copy_sol=0
fi

if [ $make_new_sol -gt 0 ]
then
    copy_sol=0
fi

py_dir=./data_utilities/
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

# clean up the directory
# just remove everything
# need to copy anything you need from work_dir before calling this script
rm $work_dir/*

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
	cp "${case_dir}/case.raw" "$raw"
	cp "${case_dir}/case.json" "$sup"
	cp "${case_dir}/case.con" "$con"
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
            cp "$i" "$raw"
	done
	for i in "$work_dir"*.json; do
	    [ -f "$i" ] || break
	    #echo "$i"
            cp "$i" "$sup"
	done
	for i in "$work_dir"*.con; do
	    [ -f "$i" ] || break
	    #echo "$i"
            cp "$i" "$con"
	done
    fi
fi

# save copy of original data - and check
echo "final data file used in sol and evals:"
echo "$raw"
echo "$sup"
echo "$con"
echo "copy data"
cp "$raw" "$raw1"
cp "$sup" "$sup1"
cp "$con" "$con1"
echo "original (copied) files:"
echo "$raw1"
echo "$sup1"
echo "$con1"
echo "check original data"
python ${py_dir}check_data.py "$raw1" "$sup1" "$con1"

# scrub data - and check
if [ $scrub_data -gt 0 ]
then
    echo "scrub data"
    python ${py_dir}scrub_data.py "$raw" "$sup" "$con" "$raw2" "$sup2" "$con2"
    echo "scrubbed files:"
    echo "$raw2"
    echo "$sup2"
    echo "$con2"
    cp "$raw2" "$raw"
    cp "$sup2" "$sup"
    cp "$con2" "$con"
    echo "check scrubbed data"
    python ${py_dir}check_data.py "$raw2" "$sup2" "$con2"
else
    echo "skip scrub data"
fi

# modify data - and check
if [ $modify_data -gt 0 ]
then
    echo "modify data"
    python ${py_dir}modify_data.py "$raw" "$sup" "$con" "$raw3" "$sup3" "$con3" "$modify_load_mode" "${sol_dir}/solution_BASECASE.txt"
    echo "modified files:"
    echo "$raw3"
    echo "$sup3"
    echo "$con3"
    cp "$raw3" "$raw"
    cp "$sup3" "$sup"
    cp "$con3" "$con"
    echo "check modified data"
    python ${py_dir}check_data.py "$raw3" "$sup3" "$con3"
else
    echo "skip modify data"
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
    mv ./solution_*.txt "$work_dir"
else
    echo "skip submission with infeasibility solution"
fi

# evaluate solution
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
