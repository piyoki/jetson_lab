# Jupyter on Jetson

*** Copy Right 2020 Kevin Yu. All rights reserved.

*** Author: Kevin Yu

*** Update Time: 2020/05/29

This repo aims to give you clear instructions on how to install **Jupyter Software** (Jupyter Lab, Jupyter Notebook) on Jetson devices. It should work on any x86 PCs or Mac as well.

Table of Contents
-----------------

**[1. Installation](#installation)**

**[2. Setup](#setup)**

**[3. Usage](#usage)**

  * [3.1 Basic Usage](#basic-usage)
  
    * [3.1.1 Markdown](#markdown)
    * [3.1.2 Cell](#cell)
    * [3.1.3 Magic Code](#magic-code)
    
    
  * [3.2 Shortcut](#shortcut)
    
  * [3.3 Add Virtual/Conda Environment](#add-virtual/conda-environment)
  
  * [3.4 Create Softlinks](#create-softlinks)
  
  * [3.5 Extensions](#extensions)
    
**[4. Remote Login](#remote-login)**

  * [4.1 SSH Login](#ssh-login)
  
  * [4.2 Http Login](#http-login)

Installation
------------

You may install Jupyter in the following two ways: with [Script](https://github.com/yqlbu/jetson_lab/blob/master/install.sh) or with [commands](#install-with-commands)

#### Install with Script

```shell script
cd ~
git clone https://github.com/yqlbu/jetson_lab
cd jetson_lab
sudo chmod +x jetson_lab
sh install.sh
```

#### Install with Commands

```shell script
# install pip
sudo pip install --upgrade pip 
sudo pip3 install --upgrade pip 
sudo apt-get install python-pip
sudo apt-get install python3-pip

# install jupyter
pip install jupyterlab
pip3 install jupyterlab
pip install --upgrade --force jupyter-console
pip3 install --upgrade --force jupyter-console

# check installation version
jupyter lab -V
```

<a name="installation"></a>

Setup
-----



<a name="setup"></a>

Usage
-----

### Basic Usage

### Shortcut

### Add Virtual/Conda Environment

### Extensions

### Create Softlinks

<a name="usage"></a>

Remote Login
------------

<a name="remote-login"></a>

### SSH Login

### Http Login