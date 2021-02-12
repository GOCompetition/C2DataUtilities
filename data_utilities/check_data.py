'''
syntax:

from a command prompt:
python check_data.py raw sup con

from a Python interpreter:
import sys
sys.argv = [raw, sup, con]
execfile("check_data.py")

sup is the JSON-formatted supplementary data file
'''

import argparse
import time

# gocomp imports
try:
    import data_utilities.data as data
except:
    import data
    
def main():

    parser = argparse.ArgumentParser(description='Check data files for a problem instance')
    
    parser.add_argument('raw_in', help='raw_in')
    parser.add_argument('sup_in', help='sup_in')
    parser.add_argument('con_in', help='con_in')
    
    args = parser.parse_args()

    start_time = time.time()
    p = data.Data()
    p.read(args.raw_in, args.sup_in, args.con_in)
    time_elapsed = time.time() - start_time
    print("read data time: %f" % time_elapsed)
    
    # show data stats
    p.print_summary()

    start_time = time.time()
    p.check()
    time_elapsed = time.time() - start_time
    print("check data time: %f" % time_elapsed)

if __name__ == '__main__':
    main()
