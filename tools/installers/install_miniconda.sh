#!/bin/bash
set -euo pipefail


if [ $# -ne 1 ]; then
    echo "Usage: $0 <path>"
    exit 1
fi


# Miniconda setting
if [ -z "${PS1:-}" ]; then
    PS1=__dummy__ # Workaround for an issue of conda.sh when set -u
fi

installer=Miniconda3-latest-Linux-x86_64.sh
# installer=Miniconda3-latest-Linux-ppc64le.sh
# installer=Miniconda3-latest-MacOSX-x86_64.pkg
# installer=Miniconda3-latest-MacOSX-x86_64.sh
# installer=Miniconda3-latest-Windows-x86.exe
# installer=Miniconda3-latest-Windows-x86_64.exe

CONDA_URL=https://repo.continuum.io/miniconda/${installer}

miniconda_path=$1

echo "rm miniconda.sh miniconda"
rm -rf miniconda.sh ${miniconda_path}
wget ${CONDA_URL} -O miniconda.sh
chmod +x miniconda.sh
./miniconda.sh -b -p ${miniconda_path}
