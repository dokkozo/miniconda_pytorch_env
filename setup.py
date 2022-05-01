#!/usr/bin/env python
import os
from setuptools import find_packages
from setuptools import setup
import sys

if sys.version_info[0] < 3 or sys.version_info[1] < 6:
    raise RuntimeError('Require python>=3.6')


requirements = {
    'install': [
        'scipy',
        'soundfile>=0.10.2',
        'h5py>=2.9.0',
        'kaldiio',
        'museval',
        'pystoi',
        'tqdm',
        'matplotlib',
        'typeguard',
        'resampy',
        'configargparse',
        'humanfriendly',
        'nara_wpe',
        'webrtcvad',
        'librosa',
        'pandas',
        'einops',
        'pysiib@git+https://github.com/kamo-naoyuki/pySIIB.git',
        ],
    'setup': ['numpy', 'pytest-runner'],
    'test': ['pytest'],
    'doc': []}
install_requires = requirements['install']
setup_requires = requirements['setup']
tests_require = requirements['test']
extras_require = {k: v for k, v in requirements.items()
                  if k not in ['install', 'setup']}

dirname = os.path.dirname(__file__)
setup(name='reponame',
      version='0.0.1',
      url='',
      author='',
      author_email='',
      description='',
      license='Apache Software License',
      packages=find_packages(include=['cocktail*']),
      install_requires=install_requires,
      setup_requires=setup_requires,
      tests_require=tests_require,
      extras_require=extras_require,
      classifiers=[
          'Programming Language :: Python',
          'Programming Language :: Python :: 3',
          'Development Status :: 5 - Production/Stable',
          'Intended Audience :: Science/Research',
          'Operating System :: POSIX :: Linux',
          'License :: OSI Approved :: Apache Software License',
          'Topic :: Software Development :: Libraries :: Python Modules'],
      )
