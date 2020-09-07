#from py.data_json import Sup
#from py.data import Data

from data_json import Sup
from data import Data
import evaluation


from pathlib import Path
import os
import sys


import json
import traceback
import shutil

import sys

basepath = '/pic/dtn/go/UWMAD_GO2/Sandbox072020'
basepath = '/pic/projects/goc/loadbalancing/src/challenge2-eval-repo/data/UWMAD_GO2/Sandbox072020'
basepath = '/pic/projects/goc/loadbalancing/src/challenge2-eval-repo/data/UWMAD_GO2/Sandbox072020_04'

basepath = '/pic/projects/goc/loadbalancing/src/challenge2-eval-repo/data/TAMU/C2/Sandbox/Aug6_07'


#basepath = "/pic/dtn/go/Terrence/sandbox"
#basepath="/pic/projects/goc/loadbalancing/src/challenge2-eval-repo/data/Terrence/sandbox/Aug10_01"
#basepath = "/pic/projects/goc/loadbalancing/src/challenge2-eval-repo/C2Eval/data/ieee14/scenario_1"

#basepath="/pic/projects/goc/loadbalancing/src/challenge2-eval-repo/data/Jesse/14_bus"

basepath="/pic/projects/goc/loadbalancing/src/challenge2-eval-repo/data/Globus"

basepath="/pic/projects/goc/loadbalancing/src/challenge2-eval-repo/data/Platform"


schema_path = Path( ".") / "sup_schema.json"


for dirname, subdirList, fileList in os.walk(basepath):
    orig_stdout = sys.stdout
    print('')
    print('')
    print('')
    print('')
    print('Found directory: %s' % dirname)
    found_case = False
    raw=''
    sup=''
    con=''
    for fname in fileList:
        fn = f'{dirname}/case.scrubbed.raw'
        os.remove(fn) if os.path.exists(fn) else None
        fn = f'{dirname}/case.scrubbed.con'
        os.remove(fn) if os.path.exists(fn) else None
        fn = f'{dirname}/case.scrubbed.json'
        os.remove(fn) if os.path.exists(fn) else None
        if 'scrubbed' in fname:
            continue
        if fname.endswith(('.raw','.RAW','.con','.json')) :
            found_case = True
        if fname.endswith(('raw','RAW')):
            raw = fname
        elif '.con' in fname:
            con = fname
        elif '.json' in fname:
            sup = fname 

    if not found_case:
        print('No case file found, skipping')
        continue


    sys.stdout = open(dirname  + '/runlog.log', 'w')


    cases = Data()

    try:
        print('------Reading case files--------------------------------------------------------------------------')
        cases.read(  f'{dirname}/{raw}',  f'{dirname}/{sup}',  f'{dirname}/{con}' )
    except:
        print('Error encountered reading case files')
        traceback.print_exc()

    try:
        print('------Checking before scrub--------------------------------------------------------------------------')
        cases.check()
    except:
        print('Error encountered in Checker')
        traceback.print_exc()

    try:
        print('------scrubbing--------------------------------------------------------------------------')
        # JH: Note we need to redo the read,
        # because scrubbing the JSON to adding default pcblocks, qcblocks, scblocks, load/gen prumaxctg/prdmaxctg
        # happens in the read function.
        # and this should not be done in the checker
        cases = Data()
        cases.sup.do_force_defaults = True # TODO need to add this to scrubber code in other places?
        cases.read(  f'{dirname}/{raw}',  f'{dirname}/{sup}',  f'{dirname}/{con}' )
        cases.scrub()
    except:
        print('Error encountered in Scrubber')
        traceback.print_exc()


    try:
        print('------writing scrubbed files--------------------------------------------------------------------------')
        cases.write(  f'{dirname}/case.scrubbed.raw',  f'{dirname}/case.scrubbed.json',  f'{dirname}/case.scrubbed.con' )
    except:
        print('Error encountered writing scrubbed files')
        traceback.print_exc()


    try:
        print('------Checking after scrub--------------------------------------------------------------------------')
        # JH: Note we need to redo the read,
        # because scrubbing the JSON to adding default pcblocks, qcblocks, scblocks, load/gen prumaxctg/prdmaxctg
        # happens in the read function.
        # and this should not be done in the checker
        cases = Data()
        cases.read(  f'{dirname}/case.scrubbed.raw',  f'{dirname}/case.scrubbed.json',  f'{dirname}/case.scrubbed.con' )
        cases.check()
    except:
        #print('Error encountered in Checker')
        print('Error encountered in Checker after scrub')
        traceback.print_exc()


    print('-------Generating dataset statistics--------------------------------------------------------------')
    evaluation.run_main(dirname, dirname)

    sys.stdout.close()
    sys.stdout=orig_stdout
