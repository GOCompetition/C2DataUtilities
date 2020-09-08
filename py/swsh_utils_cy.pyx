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
    br_concat = np.column_stack((br, br_abs))

    # make memviews
    cdef double[:] btar_v = btar
    cdef long[:,:] n_v = n_sorted
    cdef double[:,:] b_v = b_sorted
    cdef long[:,:] x_v = x_sorted
    cdef double[:,:] br_v = br_concat
    cdef double[:,:] bmax_v = bmax
    cdef double[:,:] bmin_v = bmin

    # run memview version of solve()
    solve_v(btar_v, n_v, b_v, x_v, br_v, bmax_v, bmin_v, tol)

    # put the solution back in the original order
    np.put_along_axis(x, indices, x_v, axis=1)
    br[:] = br_v[:,0]
    br_abs[:] = br_v[:,1]

# memviews version of solve
def solve_v(
        double[:] btar, long[:,:] n, double[:,:] b, long[:,:] x, double[:,:] br, double[:,:] bmax, double[:,:] bmin, double tol):

    cdef Py_ssize_t numh = x.shape[0]
    cdef Py_ssize_t numa = x.shape[1]
    #assert btar.shape[0] == numh
    #assert n.shape[0] == numh
    #assert n.shape[1] == numa
    #assert b.shape[0] == numh
    #assert b.shape[1] == numa
    #assert x.shape[0] == numh
    #assert x.shape[1] == numa
    #assert br.shape[0] == numh
    #assert br.shape[1] == 2

    # set up working data
    cdef Py_ssize_t at = 0
    brt_old = np.zeros(shape=(numa,), dtype=float)
    cdef double[:] brt_old_view = brt_old
    brt = np.zeros(shape=(2,), dtype=float)
    cdef double[:] brt_view = brt
    xt = np.zeros(shape=(numa), dtype=int)
    cdef long[:] xt_view = xt
    cdef Py_ssize_t a = 0

    cdef Py_ssize_t h
    for h in range(numh):
        # not sure we cannot just call solve_h_rec here
        solve_h(numa, btar[h], n[h,:], b[h,:], x[h,:], br[h,:], at, brt_old_view[:], brt_view[:], xt_view[:], a, bmax[h,:], bmin[h,:], tol)

# call on a single switched shunt
def solve_h(
        Py_ssize_t numa, double btar, long[:] n, double[:] b, long[:] x, double[:] br,
        Py_ssize_t at, double[:] brt_old, double[:] brt, long[:] xt, Py_ssize_t a, double[:] bmax, double[:] bmin, double tol):

    # clear out old stuff - not sure we need to
    br[0] = btar
    br[1] = np.abs(br[0])
    #br[2] = 0.0
    at = 0
    brt[0] = btar
    brt[1] = np.abs(br[0])
    for a in range(numa):
        brt_old[a] = 0.0
        xt[a] = 0
    solve_h_rec(numa, btar, n, b, x, br, at, brt_old, brt, xt, a, bmax, bmin, tol);

# recursive
def solve_h_rec(
        Py_ssize_t numa, double btar, long[:] n, double[:] b, long[:] x, double[:] br,
        Py_ssize_t at, double[:] brt_old, double[:] brt, long[:] xt, Py_ssize_t a, double[:] bmax, double[:] bmin, double tol):
    # brt has 2 entries
    # brt[0] = residual
    # brt[1] = absolute value of residual

    # todo can anything be improved by earlier declaration of work variables?

    cdef Py_ssize_t i
    
    # check solution if complete and update incumbent if improved
    if at >= numa:
        brt[1] = np.abs(brt[0])
        if brt[1] < br[1]:
            for a in range(numa):
                x[a] = xt[a]
            br[0] = brt[0]
            br[1] = brt[1]
        return

    # check bounds and prune if possible
    if br[1] <= tol * np.abs(btar):
        return
    if br[1] <= brt[0] - bmax[at] + tol * np.abs(btar):
        return
    if br[1] <= bmin[at] - brt[0] + tol * np.abs(btar):
        return

    cdef long at_old = at
    brt_old[at_old] = brt[0]

    at += 1

    xt[at_old] = 0
    solve_h_rec(numa, btar, n, b, x, br, at, brt_old, brt, xt, a, bmax, bmin, tol)
    for i in range(n[at_old]):
        xt[at_old] += 1
        brt[0] -= b[at_old]
        solve_h_rec(numa, btar, n, b, x, br, at, brt_old, brt, xt, a, bmax, bmin, tol)

    brt[0] = brt_old[at_old]
    at -= 1
