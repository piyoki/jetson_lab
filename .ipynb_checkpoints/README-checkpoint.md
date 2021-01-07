# JupyterLab on Jetson

*** Copy Right 2020 Kevin Yu. All rights reserved.

*** Author: Kevin Yu

*** Update Time: 2021/01/07

*** Contact: kevinyu211@yahoo.com | www.hikariai.net

This repo aims to give you clear instructions on how to install **Jupyter Software** (Jupyter Lab, Jupyter Notebook) on Jetson devices. It should work on any x86 PCs or Mac as well.

The guide below is a demonstration of the deployment, and the usage **JupyterLab** on Jetson. However, The usage features of Jupyter Notebook are very close to those of JupyterLab, so you should be able to apply the same techniques in Jupyter Notebook as well.

![](https://github.com/yqlbu/jetson_lab/blob/master/demo_screenshots/thumbnail.png)

## Docs

- [Wiki (EN)](https://github.com/yqlbu/jetson_lab/blob/master/Wiki.md)

## Quick Install

#### Install with Script

```bash
curl -fsSL https://raw.githubusercontent.com/yqlbu/jetson_lab/master/install.sh) | bash -
```

#### Install with Docker

```
$ docker run --name jupyterlab -d \
  -e TZ=Asia/Shanghai \
  -p 8888:8888 \
  -v /appdata/jupyterlab:/opt/app/data \
  hikariai/jupyterlab:latest
```