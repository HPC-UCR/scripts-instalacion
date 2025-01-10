#!/bin/bash

mkdir -p $HOME/bin/miniforge3
wget "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh" -O $HOME/bin/miniforge3/miniforge3.sh
bash $HOME/bin/miniforge3/miniforge3.sh -b -u -p $HOME/bin/miniforge3
mamba init

. $HOME/bin/miniforge3/bin/activate
cd $HOME/bin

mamba create -n bactopia -c conda-forge -c bioconda bactopia 'bactopia-py>=1.3.0'
