# Install
Cocktail consists of many bash scripts, so Linux OS is probably required.

## [Option A] Full installation including Miniconda and PyTorch
```bash
cd tools
# CUDA_VERSION specified CUDA linked for PyTorch
make CUDA_VERSION=10.0
```

## [Option B] Install tools in existing anaconda
```bash
cd tools
make CUDA_VERSION=10.0 CONDA_PATH=/some/where/your/conda CONDA_ENV=your-env
```

- If your anaconda already has all required tools, then nothing will be installed.
- If the anaconda directory is not existing, then creates it there.

## [Option C] Install manually without Makefile
If you met some issues about the installation with Makefile, 
try manual installation.

1. Prepare Python environment somehow.

    ```bash
    # If you'll use miniconda with Linux-OS
    ./installers/install_miniconda.sh ./miniconda
    ```
    
1. Install Cocktail python modules

    ```bash
    pip install -e ${REPOSITORY_ROOT}
    ```
    
1. Install PyTorch somehow: See https://pytorch.org/get-started/locally/
1. Install tools manually

    ```bash
    ./installers/install_py-RIR-Generator.sh
    ./installers/install_PESQ.sh
    ...
    ```

1. Create `tools/python_activate.sh`

    `tools/python_activate.sh`, which is referred by 
    [path.sh](egs/common/ss1/path.sh),
    specifies the Python enviroment to be used in scripts finally.
    For example, you can create it as following:


    ```bash
    #!/bin/bash
    # Workaround for an issue of conda.sh when set -u
    if [ -z "\${PS1:-}" ]; then
        PS1=__dummy__
    fi
    
    source /your/virtualenv/activate
    ```

