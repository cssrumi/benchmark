import os

from distutils.core import setup
from setuptools import find_packages, Extension
from Cython.Distutils import build_ext

cython_directives = {"profile": True, "language_level": "3"}
ext_options = {"compiler_directives": cython_directives, "annotate": True}

cython_class = 'cython_class.pyx'
cython_class_with_dict = 'cython_class_with_dict.pyx'


files = [
    cython_class,
    # cython_class_with_dict,
]

ext_modules = [
    Extension(f'{cython_class.replace(".pyx", "")}',
              [f'{cython_class}']),
    # Extension(f'{cython_class_with_dict.replace(".pyx", "")}',
    #           [f'{cython_class_with_dict}']),
]

for e in ext_modules:
    e.cython_directives = cython_directives

setup(
    # name='app',
    packages=find_packages(),
    cmdclass={'build_ext': build_ext},
    ext_modules=ext_modules,
    include_dirs=['.', ],
)
