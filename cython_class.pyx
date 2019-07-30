cdef class CythonClass:
    cdef float a
    cdef float b
    cdef float c
    cdef float d
    cdef float e
    cdef float f

    def __cinit__(self, a, b, c, d, e, f):
        self.a = <float> a
        self.b = <float> b
        self.c = <float> c
        self.d = <float> d
        self.e = <float> e
        self.f = <float> f

    cpdef calculate(self, test_dict: dict):
        for key in vars(self):
            print(key)

