from time import clock

from python_class import PythonClass
from python_class_with_dict import PythonClassWithDict
from cython_class import CythonClass


def timer(func):
    def wrapper(*args, **kwargs):
        before = clock()
        rv = func(*args, **kwargs)
        after = clock()
        # print(func.__name__, 'elapsed', after - before)
        print('%s elapsed %.7f' % (func.__name__, after - before))
        return rv

    return wrapper


def python_class_benchmark(test_dict: dict):
    p = PythonClass(1, 2, 3, 4, 5, 6)
    print(p.calculate(test_dict))
    print(p.calculate2(test_dict))


def cython_class_benchmark(test_dict: dict):
    c = CythonClass(1, 2, 3, 4, 5, 6)
    c.calculate(test_dict)


def python_class_with_dict_benchmark(test_dict: dict):
    p = PythonClassWithDict(1, 2, 3, 4, 5, 6)
    print(p.calculate(test_dict))


def main():
    test_dict = {'a': 5, 'b': 4, 'c': 10, 'd': 2, 'e': 13.3, 'f': 1.23}
    python_class_benchmark(test_dict)
    python_class_with_dict_benchmark(test_dict)

    cython_class_benchmark(test_dict)


if __name__ == '__main__':
    main()
