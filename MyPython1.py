'''
MyPython1.py

Entry to Python infeasibility solver, code1.
Syntax:

$ python MyPython1.py CON SUP RAW RESERVED TIMELIMIT DIVISION NETWORK
'''

# built in imports
import sys, os

# modules for this code
#try:
#    from data_utilities.infeasibility_solution import Solver
#except:
#    from infeasibility_solution import Solver
#sys.path.append(os.path.normpath('.'))
#sys.path.append(os.path.normpath('./py'))
script_path=os.path.dirname(os.path.realpath(__file__)) + '/py'
sys.path.append(script_path)
try:
    from data_utilities.infeasibility_solution import Solver
except:
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

print('\nPython infeasibility solver, code 1')
print('syntax:')
print('$ python MyPython1.py CON SUP RAW RESERVED TIMELIMIT DIVISION NETWORK')
print('args:')
print(args)

s = Solver()
s.data.read(raw_name, sup_name, con_name)
if write_ctgs_in_code1:
    s.write_sol('./')
else:
    if save_base_case_sol:
        s.write_sol1('./', saved_sol_file_name=saved_base_case_sol_file_name)
    else:
        s.write_sol1('.')
