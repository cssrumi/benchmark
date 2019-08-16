from time import clock
from cpython cimport array
import array

cdef class CythonClassWithDict:

    def __cinit__(self, a, b, c, d, e, f):
        self.dct = {}
        self.dct['a'] = a
        self.dct['b'] = b
        self.dct['c'] = c
        self.dct['d'] = d
        self.dct['e'] = e
        self.dct['f'] = f

    cpdef public float calculate(self, dict test_dict):
        cdef float _sum = 0
        _sum += self.dct['a'] * test_dict['a']
        _sum += self.dct['b'] * test_dict['b']
        _sum += self.dct['c'] * test_dict['c']
        _sum += self.dct['d'] * test_dict['d']
        _sum += self.dct['e'] * test_dict['e']
        _sum += self.dct['f'] * test_dict['f']
        return _sum


def cython_benchmark(dict test_dict):
    c = CythonClassWithDict(1, 2, 3, 4, 5, 6)
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
        CythonClassWithDict(1, 2, 3, 4, 5, 6) for _ in range(1_000_000)
    ]
    before = clock()
    cdef float result = 0
    cdef unsigned int i = 0
    for i in range(1_000_000):
        result += lst[i].calculate(test_dict)

    after = clock()
    print('%s elapsed %.7f' % ('cython_benchmark', after - before))
    return result
