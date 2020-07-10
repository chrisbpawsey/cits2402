#!/bin/bash
conda init
conda create -y --name raindrops
conda activate raindrops
conda install -q -y jupyter
conda install -y -c conda-forge tensorflow
