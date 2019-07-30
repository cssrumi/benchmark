cdef class CythonClassWithDict:
    cdef float a
    cdef float b
    cdef float c
    cdef float d
    cdef float e
    cdef float f
    
    cdef __cinit__(self, a, b, c, d, e, f):
        self.a = a
        self.b = b
        self.c = c
        self.d = d
        self.e = e
        self.f = f

    cpdef calculate(self, test_dict: dict):
        for key in vars(self):
            print(key)
