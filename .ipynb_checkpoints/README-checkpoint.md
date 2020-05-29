# Jupyter on Jetson

*** Copy Right 2020 Kevin Yu. All rights reserved.

*** Author: Kevin Yu

*** Update Time: 2020/05/29

*** Contact: kevinyu211@yahoo.com | www.hikariai.net

This repo aims to give you clear instructions on how to install **Jupyter Software** (Jupyter Lab, Jupyter Notebook) on Jetson devices. It should work on any x86 PCs or Mac as well.

The guide below is a demonstration of the deployment, and the usage **JupyterLab** on Jetson. However, The usage features of Jupyter Notebook are very close to JupyterLab, so you should be able to apply the same techniques in Jupyter Notebook as well.

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

You may install Jupyter in the following two ways: with [script](https://github.com/yqlbu/jetson_lab/blob/master/install.sh) or with [commands](#install-with-commands)

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
sudo apt-get install python-pip
sudo apt-get install python3-pip
sudo pip install --upgrade pip 
sudo pip3 install --upgrade pip

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

##### Step 0: Create Password

```shell script
jupyter-notebook password
```

##### Step 1: Create Hash Code

```shell script
ipython
from notebook.auth import passwd
passwd()
# put your password that you set in step 0 for login to Jupyter
# it will generate a hash code, save it in a txt file
# hash code sample: 'sha1:b92f3fb7d848:a5d40ab2e26aa3b296ae1faa17aa34d3df351704'
```

##### Step 2: Config JupyterLab

##### Generate a config file
```shell script
jupyter lab --generate-config
# it will be saved as "jupyter_notebook_config.py" in /home/username/.jupyter/
```
##### Modify the Content
```
cd /home/username/.jupyter/ # modify username
nano jupyter_notebook_config.py
# then press Ctrl + W to search the following lines, and modify accordingly
```
Modify the following lines:
```python
# Login as root
c.NotebookApp.allow_root = True
# Allow all IPs to log in
c.NotebookApp.ip = '0.0.0.0'
# Set JupyterLab Root Directory
c.NotebookApp.notebook_dir = u'/root/JupyterLab'
# Set to run without opening a new browser
c.NotebookApp.open_browser = False
# Set the Hash Code that was generated in the previous step
c.NotebookApp.password = u'sha1:b92f3fb7d848:a5d40ab2e26aa3b296ae1faa17aa34d3df351704'
# Set the PORT for Remote Log In
c.NotebookApp.port = 8080
```

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