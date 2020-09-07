#
# Grid Optimization Competion
# author: Jesse Holzer
# date: 2020-09-06
#

from swsh_utils_py import solve as solve_py
try:
    from swsh_utils_cy import solve as solve_cy
except Exception as e:
    print('could not import swsh_utils_cy. try "python setup.py build_ext --inplace"')
    #raise e
