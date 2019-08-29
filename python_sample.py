from time import clock

n = 300000000

before = clock()
_sum = sum((i for i in range(n)))
after = clock()

print('%s %d elapsed %.7f' % ('cython_benchmark', _sum, after - before))
