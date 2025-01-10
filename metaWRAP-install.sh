#!/bin/bash

mkdir -p $HOME/bin/miniforge3
wget "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh" -O $HOME/bin/miniforge3/miniforge3.sh
bash $HOME/bin/miniforge3/miniforge3.sh -b -u -p $HOME/bin/miniforge3

. $HOME/bin/miniforge3/bin/activate
cd $HOME/bin
git clone https://github.com/bxlab/metaWRAP.git

echo "PATH=$HOME/bin/metaWRAP/bin:$PATH" >> $HOME/.bashrc

mamba create -y -n metawrap-env python=2.7
conda activate metawrap-env
conda config --add channels defaults
conda config --add channels conda-forge
conda config --add channels bioconda
conda config --add channels ursky
mamba remove -y zlib
mamba install -y --only-deps -c ursky metawrap-mg
quast-download-gridss
quast-download-silva
quast-download-busco

sed 's+/scratch/gu/+/home/public/DB/+' $HOME/bin/metaWRAP/bin/config-metawrap
source ~/.bashrc
mamba init
