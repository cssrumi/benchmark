from time import clock


def benchmark(func):
    def wrapper(*args, **kwargs):
        before = clock()
        rv = 0
        for _ in range(1_000_000):
            rv += func(*args, **kwargs)
        after = clock()
        print('%s elapsed %.7f' % (func.__name__, after - before))
        return rv

    return wrapper


def class_benchmark(cls, test_dict, args):
    cls_list = [cls(*args) for _ in range(1_000_000)]
    before = clock()
    rv = 0
    for instance in cls_list:
        rv += instance.calculate(test_dict)
    after = clock()
    print('%s elapsed %.7f' % (cls.__name__, after - before))
    return rv


def function_benchmark(func, *args):
    before = clock()
    rv = 0
    for _ in range(1_000_000):
        rv += func(*args)
    after = clock()
    print('%s elapsed %.7f' % (func.__name__, after - before))
    return rv
