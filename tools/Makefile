CONDA_URL := https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
CONDA_PATH := ./miniconda
CONDA_ENV := cocktail

PYTORCH := 1.8
# Specifiy CUDA version for pytorch
CUDA_VERSION := 11.1

# Used for ffmpeg version: amd64 arm64 armhf armel
CPU := i686

.PHONY: all clean

all: \
	python_activate.sh \
	module.install \
	pytorch.install \
	ffmpeg

$(CONDA_PATH)/etc/profile.d/conda.sh:
	./installers/install_miniconda.sh $(CONDA_PATH)

miniconda/envs/$(CONDA_ENV): $(CONDA_PATH)/etc/profile.d/conda.sh
	source $(shell cd $(CONDA_PATH);pwd)/etc/profile.d/conda.sh && conda create -yn $(CONDA_ENV) python=3.7

python_activate.sh: miniconda/envs/$(CONDA_ENV)
	installers/create_python_activate.sh $(CONDA_PATH) $(CONDA_ENV) > python_activate.sh

pytorch.install: python_activate.sh
	source ./python_activate.sh && conda install -y pytorch=$(PYTORCH) torchvision cudatoolkit=$(CUDA_VERSION) -c pytorch -c conda-forge
	touch pytorch.install

module.install: pytorch.install
	source ./python_activate.sh && pip install -e ..
	touch module.install

ffmpeg: ffmpeg-static/ffmpeg
ffmpeg-static/ffmpeg:
	installers/install_ffmpeg.sh $(CPU)

clean:
	rm -rf kaldi sph2pipe_v2.5* PESQ* miniconda *.install ffmpeg* facenet_pytorch_src/ sctk* py-RIR-Generator/build miniconda.sh ./signal_processing ./fdbss
