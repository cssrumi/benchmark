from time import clock


def benchmark(func):
    def wrapper(*args, **kwargs):
        before = clock()
        for _ in range(1_000_000):
            rv = func(*args, **kwargs)
        after = clock()
        print('%s elapsed %.7f' % (func.__name__, after - before))
        return rv

    return wrapper
