#!/usr/bin/env bash

set -e
set -x

if [[ -e $HOME/miniconda/bin/conda ]]; then
    conda env update -f $DIR/../environment.yml
# Otherwise, install conda and create environment
else
    if [[ $TRAVIS_OS_NAME == 'osx' ]]; then
        wget https://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh -O ~/miniconda.sh
    else
        wget https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh
    fi
    bash ~/miniconda.sh -b -f -p $HOME/miniconda
    conda env create -f $DIR/../environment.yml
fi