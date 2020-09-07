#
# Grid Optimization Competion
# author: Jesse Holzer
# date: 2020-09-06
#
# to compile use
#
#   $ python setup.py build_ext --inplace
#

import numpy as np

# import this from python
def solve(btar, n, b, x, br, br_abs, tol):

    # check conditions
    numh = n.shape[0]
    numa = n.shape[1]
    assert btar.shape[0] == numh
    assert n.shape[0] == numh
    assert n.shape[1] == numa
    assert b.shape[0] == numh
    assert b.shape[1] == numa
    assert x.shape[0] == numh
    assert x.shape[1] == numa
    assert br.shape[0] == numh
    assert br_abs.shape[0] == numh
    assert tol >= 0.0

    # preprocessing
    bd = np.multiply(n, b)
    bmax = np.maximum(0.0, bd)
    bmin = np.minimum(0.0, bd)
    bd = np.absolute(bd)
    indices = np.argsort(np.negative(bd), axis=1)

    # combute bd (diameter), bmax, bmin, and sort by decreasing bd
    n_sorted = np.take_along_axis(n, indices, axis=1)
    b_sorted = np.take_along_axis(b, indices, axis=1)
    x_sorted = np.take_along_axis(x, indices, axis=1)
    bmax = np.take_along_axis(bmax, indices, axis=1)
    bmin = np.take_along_axis(bmin, indices, axis=1)
    bmax = np.cumsum(bmax[:,::-1], axis=1)[:,::-1]
    bmin = np.cumsum(bmin[:,::-1], axis=1)[:,::-1]

    # run version of solve() with sorted arguments
    solve_sorted(btar, n_sorted, b_sorted, x_sorted, br, br_abs, bmax, bmin, tol)

    # put the solution back in the original order
    np.put_along_axis(x, indices, x_sorted, axis=1)

# version of solve with sorted arguments
def solve_sorted(
        btar, n, b, x, br, br_abs, bmax, bmin, tol):

    numh = x.shape[0]
    numa = x.shape[1]

    # set up working data
    #cdef Py_ssize_t at = 0
    at = 0
    brt_old = np.zeros(shape=(numa,), dtype=float)
    brt = np.zeros(shape=(2,), dtype=float)
    xt = np.zeros(shape=(numa), dtype=int)
    #cdef Py_ssize_t a = 0
    a = 0

    for h in range(numh):
        # not sure we cannot just call solve_h_rec here
        solve_h(numa, btar[h], n[h,:], b[h,:], x[h,:], br[h,:], br_abs[h,:], at, brt_old, brt, xt, a, bmax[h,:], bmin[h,:], tol)

# call on a single switched shunt
def solve_h(
        numa, btar, n, b, x, br, br_abs,
        at, brt_old, brt, xt, a, bmax, bmin, tol):

    # clear out old stuff - not sure we need to
    br[0] = btar
    br_abs[0] = np.abs(br[0])
    at = 0
    brt[0] = btar
    brt[1] = np.abs(br[0])
    for a in range(numa):
        brt_old[a] = 0.0
        xt[a] = 0
    solve_h_rec(numa, btar, n, b, x, br, at, brt_old, brt, xt, a, bmax, bmin, tol);

# recursive
def solve_h_rec(
        numa, btar, n, b, x, br, br_abs,
        at, brt_old, brt, xt, a, bmax, bmin, tol):

    cdef Py_ssize_t i
    
    # check solution if complete and update incumbent if improved
    if at >= numa:
        np.abs(brt, out=brt_abs)
        if brt_abs[0] < br_abs[0]:
            x[:] = xt
            br[:] = brt
            br_abs[:] = brt_abs
        return

    # check bounds and prune if possible
    if br_abs[0] <= tol * np.abs(btar):
        return
    if br_abs[0] <= brt[0] - bmax[at] + tol * np.abs(btar[0]):
        return
    if br_abs[0] <= bmin[at] - brt[0] + tol * np.abs(btar[0]):
        return

    at_old = at
    brt_old[at_old] = brt[0]

    at += 1

    xt[at_old] = 0
    solve_h_rec(numa, btar, n, b, x, br, br_abs, at, brt_old, brt, xt, a, bmax, bmin, tol)
    for i in range(n[at_old]):
        xt[at_old] += 1
        brt[0] -= b[at_old]
        solve_h_rec(numa, btar, n, b, x, br, br_abs, at, brt_old, brt, xt, a, bmax, bmin, tol)

    brt[0] = brt_old[at_old]
    at -= 1
