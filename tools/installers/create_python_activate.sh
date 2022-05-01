#!/bin/bash
set -euo pipefail

if [ $# -ne 2 ]; then
    echo "Usage: $0 <conda-root> <conda-env>"
    exit 1
fi

CONDA_PATH=$1
CONDA_ENV=$2
if [ ! -d ${CONDA_PATH} ]; then
    echo "$0: Error: ${CONDA_PATH}: No such file or directory"
    exit 1
fi
CONDA_PATH=$(cd ${CONDA_PATH};pwd)

cat << EOF
#!/bin/bash
# Workaround for an issue of conda.sh when set -u
if [ -z "\${PS1:-}" ]; then
    PS1=__dummy__
fi
source ${CONDA_PATH}/etc/profile.d/conda.sh
conda deactivate
conda activate ${CONDA_ENV}
EOF
