'''
syntax:

from a command prompt:
python scrub_data.py raw_in sup_in con_in raw_out sup_out con_out

from a Python interpreter:
import sys
sys.argv = [raw_in, sup_in, con_in, raw_out, sup_out, con_out]
execfile("scrub_data.py")
'''

import argparse
import time

# gocomp imports
import data
    
def main():

    parser = argparse.ArgumentParser(description='Create a clean copy of the data for a problem instance')
    
    parser.add_argument('raw_in', help='raw_in')
    parser.add_argument('sup_in', help='sup_in')
    parser.add_argument('con_in', help='con_in')
    parser.add_argument('raw_out', help='raw_out')
    parser.add_argument('sup_out', help='sup_out')
    parser.add_argument('con_out', help='con_out')
    
    args = parser.parse_args()

    start_time = time.time()
    p = data.Data()
    p.sup.do_force_defaults = True # TODO need to add this to scrubber code in other places?
    p.read(args.raw_in, args.sup_in, args.con_in)
    time_elapsed = time.time() - start_time
    print("read data time: %f" % time_elapsed)
    
    # show data stats
    print("buses: %u" % len(p.raw.buses))
    print("loads: %u" % len(p.raw.loads))
    print("fixed_shunts: %u" % len(p.raw.fixed_shunts))
    print("generators: %u" % len(p.raw.generators))
    print("nontransformer_branches: %u" % len(p.raw.nontransformer_branches))
    print("transformers: %u" % len(p.raw.transformers))
    print("transformer impedance correction tables: %u" % len(p.raw.transformer_impedance_correction_tables))
    print("switched_shunts: %u" % len(p.raw.switched_shunts))
    print('contingencies: %u' % len(p.con.contingencies))

    start_time = time.time()
    p.check()
    time_elapsed = time.time() - start_time
    print("check data time: %f" % time_elapsed)

    start_time = time.time()
    p.scrub()
    end_time = time.time()
    print("scrub data time: %f" % (end_time - start_time))

    start_time = time.time()
    p.write(args.raw_out, args.sup_out, args.con_out)
    time_elapsed = time.time() - start_time
    print("write data time: %f" % time_elapsed)

if __name__ == '__main__':
    main()
