from benchmark import benchmark


class PythonClass:
    def __init__(self, a, b, c, d, e, f):
        self.a = a
        self.b = b
        self.c = c
        self.d = d
        self.e = e
        self.f = f

    # much faster
    # @benchmark
    def calculate(self, dct: dict):
        return sum([dct[key] * self.__dict__[key] for key in vars(self)])

    # @benchmark
    def calculate2(self, dct: dict):
        return sum([dct[key] * getattr(self, key) for key in vars(self)])
