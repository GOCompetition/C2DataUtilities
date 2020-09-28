'''
MyPython2.py

Entry to Python infeasibility solver, code2.
Syntax:

$ python MyPython2.py CON SUP RAW RESERVED TIMELIMIT DIVISION NETWORK
'''

# built in imports
import sys, os

# modules for this code
# better way to make this visible?
# use a startup script to run setup.py to make data_utilities available as a package
sys.path.append(os.path.normpath('.'))
sys.path.append(os.path.normpath('./py'))
from infeasibility_solution import Solver

args = sys.argv

con_name = args[1]
sup_name = args[2]
raw_name = args[3]
reserved = args[4]
time_limit = args[5]
division = args[6]
network = args[7]
#sol1_name = 'solution1.txt'
#sol2_name = 'solution2.txt'
write_ctgs_in_code1 = False
save_base_case_sol = True
saved_base_case_sol_file_name = 'saved_solution_BASECASE.bin'

print('\nPython infeasibility solver, code 2')
print('syntax:')
print('$ python MyPython2.py CON SUP RAW RESERVED TIMELIMIT DIVISION NETWORK')
print('args:')
print(args)

if write_ctgs_in_code1:
    pass
else:
    s = Solver()
    s.data.read(raw_name, sup_name, con_name)
    if save_base_case_sol:
        s.write_sol2('./', saved_sol_file_name=saved_base_case_sol_file_name)
    else:
        s.write_sol2('./')
