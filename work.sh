#!/bin/sh

# override data selection
#case_dir=/pic/dtn/go/Steve/C2/sandbox/TAMU/Sep16/tgo500/tgo500_0010_5857/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/TAMU/Sep16/tgo500/tgo500_0010_5857/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/TAMU/Sep16/tgo10K/tgo10K_0060_7178/
#case_dir=/pic/projects/goc/loadbalancing/src/challenge2-eval-repo/data/Platform/Sep30_01/Sep30_TAMU01/tgo10K/tgo10K_0060_7178/
#case_dir=/pic/projects/goc/loadbalancing/src/challenge2-eval-repo/data/Platform/Sep30_01/Sep30_TAMU01/tgo2000/tgo2000_0100_0289/
#/pic/projects/goc/submission-manager/submission-manager-tmp/arunveeramany/TESTSUB9_1_1/C2S3N00014_output1/

# C2DataUtilities test data
#case_dir=./data/ieee14/scenario_1/
#case_dir=./data/ieee14/scenario_2/
#case_dir=./data/ieee14/scenario_3/

# Originals
#case_dir=/pic/dtn/go/Jesse/C2N00014/scenario_02/

# sandbox
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S4N00014/scenario_01/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S4N00014/scenario_02/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S4N00594/scenario_01/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S4N00594/scenario_02/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S4N00594/scenario_03/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S4N00594/scenario_04/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S4N00594/scenario_05/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S4N02000/scenario_01/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S4N02000/scenario_02/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S4N02000/scenario_03/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S4N02000/scenario_04/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S4N02000/scenario_05/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S4N02044/scenario_01/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S4N02044/scenario_02/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S4N02044/scenario_03/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S4N02044/scenario_04/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S4N02380/scenario_01/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S4N02380/scenario_02/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S4N02380/scenario_03/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S4N02380/scenario_04/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S4N02380/scenario_05/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S4N02742/scenario_01/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S4N02742/scenario_02/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S4N02742/scenario_03/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S4N02742/scenario_04/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S4N02742/scenario_05/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S4N04225/scenario_01/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S4N04229/scenario_01/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S4N04229/scenario_02/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S4N04229/scenario_03/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S4N09459/scenario_01/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S4N09462/scenario_01/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S4N09462/scenario_02/
case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S4N11152/scenario_01/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S4N11152/scenario_02/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S4N11152/scenario_03/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S4N11152/scenario_04/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S4N11152/scenario_05/

# trial 1
#case_dir=/pic/dtn/go/Steve/C2/T1/GaTech/Trial_1_Oct8/France-EHV-Lyon_BB/scenario_1/
#case_dir=/pic/dtn/go/Steve/C2/T1/GaTech/Trial_1_Oct8/France_NB/scenario_1/
#case_dir=/pic/dtn/go/Steve/C2/T1/GaTech/Trial_1_Oct8/MSR_BB/scenario_1/
#case_dir=/pic/dtn/go/Steve/C2/T1/GaTech/Trial_1_Oct8/MSR_NB/scenario_1/
#case_dir=/pic/dtn/go/Steve/C2/T1/GaTech/Trial_1_Oct8/Network_02R-173-tgo500_20190828/scenario_1/
#case_dir=/pic/dtn/go/Steve/C2/T1/GaTech/Trial_1_Oct8/Network_03R-200_S0700_20190923/scenario_1/
#case_dir=/pic/dtn/go/Steve/C2/T1/GaTech/Trial_1_Oct8/Network_25R-060_UW-LA2ND-24464_20191025/scenario_1/
#case_dir=/pic/dtn/go/Steve/C2/T1/GaTech/Trial_1_Oct8/Network_70R-422_S2000_20190625/scenario_1/
#case_dir=/pic/dtn/go/Steve/C2/T1/GaTech/Trial_1_Oct8/Network_70R-422_S2000_20190923/scenario_1/

# ad hoc analysis
#case_dir=/people/holz501/gocomp/c2/data/UWMAD_GO2_AUS/
#case_dir=/people/holz501/gocomp/c2/data/TAMU_GOTx600_5002_0006/

# set options
strict_names=0
refresh_data=1
check_data=1
scrub_data=1
check_scrubbed_data=1
make_new_sol=0
eval_sol=0
do_submission=0
eval_submission=0
division=1
num_proc=1

py_dir=./py/
work_dir=./tmp/
raw1="${work_dir}/case.raw"
raw2="${work_dir}/case.scrubbed.raw"
sup1="${work_dir}/case.json"
sup2="${work_dir}/case.scrubbed.json"
con1="${work_dir}/case.con"
con2="${work_dir}/case.scrubbed.con"

echo "case: ${case_dir}"

if [ ! -d "$work_dir" ] 
then
    mkdir "$work_dir"
fi

# clean up the directory
rm $work_dir/*.eval.log

# copy to here
if [ $refresh_data -gt 0 ]
then
    rm $work_dir/*.raw
    rm $work_dir/*.json
    rm $work_dir/*.con
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
    if [ $refresh_data -gt 0 ]
    then
	cp "$raw1" "$raw2"
	cp "$sup1" "$sup2"
	cp "$con1" "$con2"
    fi
fi

# check scrubbed data
if [ $check_scrubbed_data -gt 0 ]
then
    echo "check scrubbed data"
    python ${py_dir}check_data.py "$raw2" "$sup2" "$con2"
else
    echo "skip check scrubbed data"
fi

# construct infeasibility solution
if [ $make_new_sol -gt 0 ]
then
    echo "construct new infeasibility solution"
    rm ${work_dir}/solution_*.txt
    python ${py_dir}construct_infeasibility_solution.py "$raw2" "$sup2" "$con2" "$work_dir"
else
    echo "skip construct new infeasibility solution"
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
    python MyPython1.py "$con2" "$sup2" "$raw2" $reserved $timelimit $division $network
    python MyPython2.py "$con2" "$sup2" "$raw2" $reserved $timelimit $division $network
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


