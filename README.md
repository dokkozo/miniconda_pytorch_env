# Create Miniconda Env

## Setup
- Change reponame to your repository name in the following files
    - `tools/Makefile`
- Edit `setup.py` to specify required modules and versions

## Install miniconda
```bash
$ cd tools
$ make CUDA_VERSION=10.0 PYTHORCH=1.0
```

## Activate miniconda
```bash
$ source tools/python_activate.sh
```