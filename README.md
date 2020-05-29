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
  
  * [4.2 HTTP Login](#http-login)

Installation
------------

You may install Jupyter in the following two ways: with [script](https://github.com/yqlbu/jetson_lab/blob/master/install.sh) or with [commands](#install-with-commands)

#### Install with Script

```shell script
cd ~
wget https://raw.githubusercontent.com/yqlbu/jetson_lab/master/install.sh
sudo chmod +x install.sh
sh install.sh
```

#### Install with Commands

```bash
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

# export environment path

```

<a name="installation"></a>

Setup
-----

##### Step 0: Create Password

```bash
jupyter-notebook password
```

##### Step 1: Create Hash Code

```bash
ipython
from notebook.auth import passwd
passwd()
# put your password that you set in step 0 for login to Jupyter
# it will generate a hash code, save it in a txt file
# hash code sample: 'sha1:b92f3fb7d848:a5d40ab2e26aa3b296ae1faa17aa34d3df351704'
```

##### Step 2: Config JupyterLab

##### Generate a config file
```bash
jupyter lab --generate-config
# it will be saved as "jupyter_notebook_config.py" in /home/username/.jupyter/
```

##### Modify the Content
```bash
mkdir ~/JupyterLab
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
c.NotebookApp.notebook_dir = u'/home/username/JupyterLab' # modify username
# Set to run without opening a new browser
c.NotebookApp.open_browser = False
# Set the Hash Code that was generated in the previous step
c.NotebookApp.password = u'sha1:b92f3fb7d848:a5d40ab2e26aa3b296ae1faa17aa34d3df351704'
# Set the PORT for Remote Log In
c.NotebookApp.port = 8080
```

##### Step 3: Run

```bash
jupyter lab
```

Now,  you should be able to log in at [localhost:8080](http://localhost:8080)

<a name="setup"></a>

Usage
-----

### Basic Usage

Notes: The usage of JupyterLab is basically identical to that of Jupyter Notebook

<a name="basic-usage"></a>

#### Markdown

For any Markdown file, you may open a preview window while editing.

To do so, open a **.md** file and simply **Right-Click** >> **Show Markdown Preview**

<a name="markdown"></a>

![](http://www.5845.cn/wp-content/uploads/2020/02/7057214fab6a3db5f5291164e87b2598.gif)

#### Cell

A single Notebook is a Kernel, and it contains multiple cells

There are three types of cell: markdown, code, and row

Open up a notebook, select a cell and then press the **M key**, the cell will convert to markdown format. Press the **Y key** to change it back to the default code format.

![](http://www.5845.cn/wp-content/uploads/2020/02/5cb35387e50794128218446c38d8f17b.gif)

<a name="cell"></a>

#### Magic Code

The special commands that embedded in IPython are so called **"Magic Code"**. Magic Code often starts with a **"%"**

(1) **％timeit** can check the runtime of executing a specific line of code.

(2) **%run** can run any Python file inside a cell. Eg: %run hello_world.py

(3) **%cd + file_dir** can navigate to a particular directory in your machine. Eg: %cd ~

--- Notes: You may also execute shell commands inside a cell. To do so, simply place a **"!"** before the shell command.

For example:

(4) **!pip3 list** : check installed python packages

(5) **!sudo apt-get install xxx** : install deb packages

(6) **!sh demo.sh** : execute a bash script



<a name="magic-code"></a>

---

### Shortcut

Being familiar to the embedded shortcut in JupyterLab may help us enhance working efficiency, the table below demonstrates the most commonly used shortcuts, try them out!

|  key  | shortcut |       description       |
|:-----:|:--------:|:-----------------------:|
| Enter |   Enter  |        edit mode        |
|  Esc  |    Esc   |       command mode      |
|   A   |     a    |  create new cell above  |
|   B   |     b    |  create new cell below  |
|   C   |     c    |           copy          |
|   V   |     v    |          paste          |
|   M   |     m    | switch cell to markdown |
|   Y   |     y    |   switch cell to code   |
|   ↑   |    up    |    select cell above    |
|   ↓   |   down   |    select cell below    |
|  D-D  |    d*2   |   delete selected cell  |
|  I-I  |    i*2   |      stop the cell      |

<a name="shortcut"></a>

---

### Add Virtual/Conda Environment

<a name="add-virtual/conda-environment"></a>

---

### Extensions

<a name="extensions"></a>

---

### Create Softlinks

Jupyter Lab is set to open within the default root directory set in the config file. In order to access files outside the root directory, you need to create softlinks.

```bash
cd $HOME/JupyterLab/
mkdir symlink/
ln -s dir_path symlink
```

To unlink

```bash
cd $HOME/JupyterLab/
unlink symlink
```

<a name="create-softlinks"></a>

Remote Login
------------

<a name="remote-login"></a>

### SSH Login

<a name="ssh-login"></a>

### HTTP Login

<a name="http-login"></a>