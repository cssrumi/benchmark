cdef class CythonClass:
    cdef float a
    cdef float b
    cdef float c
    cdef float d
    cdef float e
    cdef float f

    cpdef public float calculate(self, dict test_dict: dict)

cdef class Test:

    cpdef public void init_test(self)

