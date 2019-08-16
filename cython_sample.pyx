from cython.parallel import prange
from time import clock

cdef long long i
cdef long long n = 300000000
cdef long long sum = 0
cdef long long result = 44999999850000000

for _ in range(100):
    sum = 0
    before = clock()
    for i in prange(n, nogil=True):
        sum += i
    after = clock()

    print('%s %d elapsed %.7f is valid=%r' % ('cython_benchmark',sum , after - before, not bool(sum-result)))
