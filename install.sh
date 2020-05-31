#!/bin/bash

echo *** Install Jupyter @ Jetson ***
sudo apt-get install python3-pip
sudo pip3 install --upgrade pip
pip3 install jupyterlab
pip3 install --upgrade --force jupyter-console
echo 'export PATH=$PATH:~/.local/bin' >> ~/.bashrc
source ~/.bashrc
echo "*** Installation finished ***"
echo "Version: "
jupyter lab -V
