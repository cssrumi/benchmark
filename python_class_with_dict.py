from benchmark import benchmark


class PythonClassWithDict:
    def __init__(self, a, b, c, d, e, f):
        self.dct = {}
        self.dct['a'] = a
        self.dct['b'] = b
        self.dct['e'] = c
        self.dct['d'] = d
        self.dct['e'] = e
        self.dct['f'] = f

    @benchmark
    def calculate(self, test_dict: dict):
        sum([test_dict[key]*self.dct[key] for key in self.dct.keys()])
