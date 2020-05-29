#!/bin/bash

echo *** Install Jupyter @ Jetson ***
pip install jupyterlab
pip3 install jupyterlab
pip install --upgrade --force jupyter-console
pip3 install --upgrade --force jupyter-console
export PATH=$PATH:~/.local/bin
echo *** Installation finished ***