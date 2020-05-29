# Jupyter on Jetson

*** Copy Right 2020 Kevin Yu. All rights reserved.

*** Author: Kevin Yu

*** Update Time: 2020/05/29

*** Contact: kevinyu211@yahoo.com | www.hikariai.net

This repo aims to give you clear instructions on how to install **Jupyter Software** (Jupyter Lab, Jupyter Notebook) on Jetson devices. It should work on any x86 PCs or Mac as well.

The guide below is a demonstration of the deployment, and the usage **JupyterLab** on Jetson. However, The usage features of Jupyter Notebook are very close to those of JupyterLab, so you should be able to apply the same techniques in Jupyter Notebook as well.

Table of Contents
-----------------

**[1. Installation](#installation)**

**[2. Setup](#setup)**

**[3. Usage](#usage)**

  * [3.1 Basic Usage](#basic-usage)
  
    * [3.1.1 Markdown](#markdown)
    
    * [3.1.2 Cell](#cell)
    
    * [3.1.3 Magic Code](#magic-code)
    
    * [3.1.4 Auto Completion](#auto-completion)
    
  * [3.2 Shortcut](#shortcut)
    
  * [3.3 Add Conda Environment](#add-conda-environment)
  
  * [3.4 Create Softlinks](#create-softlinks)
  
  * [3.5 Extensions](#extensions)
    
**[4. Remote Login](#remote-login)**

  * [4.1 SSH Login](#ssh-login)
  
  * [4.2 HTTP Login](#http-login)
  
  * [4.3 HTTPS Login](#https-login)

Installation
------------

You may install Jupyter in the following two ways: with [script](https://github.com/yqlbu/jetson_lab/blob/master/install.sh) or with [commands](#install-with-commands)

-- Notes: By default, JupyterLab will be installed with Python3.x Version, if you want to install with Python2.7 version, simply do pip install instead of pip3.

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
sudo apt-get install python3-pip
sudo pip3 install --upgrade pip

# install jupyter
pip3 install jupyterlab
pip3 install --upgrade --force jupyter-console

# export environment path
echo >> export PATH=$PATH:~/.local/bin ~/.bashrc
source ~/.bashrc

# check installation version
jupyter lab -V
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

#### Auto Completion

The Auto Completion feature is embedded in JupyterLab and Jupyter Notebook, to invoke this feature, simply press the **"Tab"** key when you typing a line of code.

![](demo_screenshots/autocomplete.png)

<a name="auto-completion"></a>

---

### Shortcut

Being familiar to the embedded shortcut in JupyterLab may help us enhance working efficiency, the table below demonstrates the most commonly used shortcuts, try them out!

|      key      |    shortcut   |          description          |
|:-------------:|:-------------:|:-----------------------------:|
|     Enter     |     Enter     |           edit mode           |
|      Esc      |      Esc      |          command mode         |
|       A       |       a       |     create new cell above     |
|       B       |       b       |     create new cell below     |
|       C       |       c       |              copy             |
|       V       |       v       |             paste             |
|       M       |       m       |    switch cell to markdown    |
|       Y       |       y       |      switch cell to code      |
|       ↑       |       up      |       select cell above       |
|       ↓       |      down     |       select cell below       |
|      D-D      |      d*2      |      delete selected cell     |
|      I-I      |      i*2      |         stop the cell         |
| Shift + Enter | Shift + Enter | Run the current selected cell |

<a name="shortcut"></a>

---

### Add Conda Environment

The default Kernel in JupyterLab is set as the system Kernel (Python3). Follow the instructions below to add a conda environment into the Kernel list in JupyterLab.

[Anaconda](https://www.anaconda.com/) is a free and open-source distribution of the Python and R programming languages for scientific computing (data science, machine learning applications, large-scale data processing, predictive analytics, etc.), that aims to simplify package management and deployment. Like Virtualenv, Anaconda also uses the concept of creating environments so as to isolate different libraries and versions.

#### Step 0: Install Conda

-- Notes: if you have already installed Anaconda 3 in your machine, skip this step

For Jetson devices or other ARM-based IoT devices, take a look at the [Archiconda3](https://github.com/yqlbu/archiconda3) reference for installation guide.

For x86 PC or Mac, visit [Anaconda](https://www.anaconda.com/products/individual) site for installation guide.

For Ubuntu 18.04 x86, use the following commands:

```bash
sudo apt-get install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6
wget https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh
bash ~/Anaconda3-2020.02-Linux-x86_64.sh
source anaconda3/bin/activate
```

#### Step 1: Install Conda-Kernels

```bash
conda install -c gaiar nb_conda_kernels
```

#### Step 2: Add Conda Env to Kernels

You will need to first **activate the conda environment**, and install the **ipykernel** within the conda environment.

```bash
conda activate envname
conda install ipykernel
conda deactivate
python3 -m ipykernel install --user --name=envname
```

Other Operations:

**Remove a conda environment from Kernel list**

```bash
jupyter kernelspec uninstall envname
```

**List all conda environments in Kernel**

```bash
jupyter kernelspec list
```

-- Notes: If everything has been setup properly, you should be able to find the new added Conda Environment in the Kernel list.

![](demo_screenshots/conda_env.png)
![](demo_screenshots/conda_env_2.png)


<a name="add-virtual/conda-environment"></a>

---

### Extensions

Fundamentally, JupyterLab is designed as an extensible environment. JupyterLab extensions can customize or enhance any part of JupyterLab. They can provide new themes, file viewers and editors, or renderers for rich outputs in notebooks. Extensions can add items to the menu or command palette, keyboard shortcuts, or settings in the settings system. Extensions can provide an API for other extensions to use and can depend on other extensions.

#### Step 0: Enable Extensions

-- Notes: The extensions enable is set to False by default. 

You need to manually modify the config file in JupyterLab. To do so, Go to **Settings** >> **Advanced Setting Editor** >> **User Preferences**, and modify **"enable"** from **False** to **True**

![](demo_screenshots/config.png)

#### Step 1: Install NodeJS

JupyterLab extensions are npm packages (the standard package format in Javascript development). You can search for the keyword jupyterlab-extension on the npm registry to find extensions.

```bash
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs
nodejs -v
npm -v
jupyter lab build
```

#### Step 2: Install Extensions

（1）Please check out the most popular extensions tailored for JupyterLab in the repo [HERE](https://github.com/mauhai/awesome-jupyterlab)

（2）Recommended Extension: [JupyterLab SysMonitor](https://github.com/jtpio/jupyterlab-system-monitor)

**Installation:**

```bash
sudo pip3 install nbresuse==0.3.3
jupyter labextension install jupyterlab-topbar-extension jupyterlab-system-monitor
```

**Add config:**

```bash
nano ~/.jupyter/jupyter_notebook_config.py
```

add the following lines to the bottom

```python
c = get_config()
c.NotebookApp.ResourceUseDisplay.mem_limit = 17179869184 # 16G, modify it based on your system
c.NotebookApp.ResourceUseDisplay.track_cpu_percent = True
c.NotebookApp.ResourceUseDisplay.cpu_limit = 4 # 4 cores, modify it based on your system
```

**Rebuild:**

```
jupyter lab build
```

<a name="extensions"></a>

![](demo_screenshots/system.png)

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

Run jupyter lab remotely from your client machine via **SSH** connection

Run the following commands in your local machine to connect as a client

```bash
ssh -L 8000:localhost:PORT username_@server_ip
# eg: ssh -L 8000:localhost:8080 nvidia@10.10.10.65
```

What the above command does is it maps the 8000 Port of the local machine (client) to the 8080 Port of Jupyter in the host machine (Jetson)

-- Notes: 

  - username_@server_ip is where you host your Jupyter at
  - PORT is the PORT number you specify in the jupyter_config file
  
-- Now, you should be able to log in at **http://ip:8080**

<a name="ssh-login"></a>

### HTTP Login

Run jupyter lab remotely from your client machine via HTTP/HTTPS

For **HTTP** connection, the setup steps are pretty much identical to the steps in the [setup](setup) section. Read the instructions carefully, and you should be good to go.

Modify the following lines in **jupyter_notebook_config.py**:
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

-- Now, you should be able to log in at **http://ip:8080**

### HTTPS Login

You will have to use a Proxy Server such as [Nginx](https://www.nginx.com/) and [Apache2](https://httpd.apache.org/), and then use its **"[Reverse Proxy](https://docs.nginx.com/nginx/admin-guide/web-server/reverse-proxy/)"** service to map a specify PORT of an App (Jupyter) to a Domain.

<a name="http-login"></a>