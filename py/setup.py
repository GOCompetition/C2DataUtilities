#
# Grid Optimization Competion
# author: Jesse Holzer
# date: 2020-09-06
#
# to compile use
#
#   $ python setup.py build_ext --inplace
#

from setuptools import setup
from Cython.Build import cythonize

setup(
    ext_modules=cythonize(
        ["swsh_utils_cy.pyx"]))
