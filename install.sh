#!/bin/bash

echo *** Install Jupyter @ Jetson ***
sudo pip3 install --upgrade pip 
sudo apt-get install python3-pip
pip3 install jupyterlab
pip3 install --upgrade --force jupyter-console
export PATH=$PATH:~/.local/bin >> ~/.bashrc
echo "*** Installation finished ***"
echo "Version: "
jupyter lab -V
