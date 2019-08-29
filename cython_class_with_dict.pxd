cdef class CythonClassWithDict:
    cdef dict dct

    cpdef public float calculate(self, dict test_dict)
