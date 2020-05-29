#!/bin/bash

echo *** Install Jupyter @ Jetson ***
sudo pip install --upgrade pip 
sudo pip3 install --upgrade pip 
sudo apt-get install python-pip
sudo apt-get install python3-pip
pip install jupyterlab
pip3 install jupyterlab
pip install --upgrade --force jupyter-console
pip3 install --upgrade --force jupyter-console
export PATH=$PATH:~/.local/bin
echo *** Installation finished ***