from time import clock
from cpython cimport array
import array


cdef class CythonClass:

    def __cinit__(self, a, b, c, d, e, f):
        self.a = <float> a
        self.b = <float> b
        self.c = <float> c
        self.d = <float> d
        self.e = <float> e
        self.f = <float> f

    cpdef public float calculate(self, dict test_dict):
        cdef float _sum = 0
        _sum += self.a * test_dict['a']
        _sum += self.b * test_dict['b']
        _sum += self.c * test_dict['c']
        _sum += self.d * test_dict['d']
        _sum += self.e * test_dict['e']
        _sum += self.f * test_dict['f']
        return _sum


cdef class Test:

    cpdef public void init_test(self):
        c = CythonClass(1, 2, 3, 4, 5, 6)
        print(c.a)

def cython_benchmark(dict test_dict):
    c = CythonClass(1, 2, 3, 4, 5, 6)
    before = clock()
    cdef float result = 0
    cdef unsigned int i = 0
    for i in range(1_000_000):
        result += c.calculate(test_dict)

    after = clock()
    print('%s elapsed %.7f' % ('cython_benchmark', after - before))
    return result

def cython_class_benchmark(test_dict):
    cdef list lst = [
        CythonClass(1, 2, 3, 4, 5, 6) for _ in range(1_000_000)
    ]
    before = clock()
    cdef float result = 0
    cdef unsigned int i = 0
    for i in range(1_000_000):
        result += lst[i].calculate(test_dict)

    after = clock()
    print('%s elapsed %.7f' % ('cython_benchmark', after - before))
    return result
