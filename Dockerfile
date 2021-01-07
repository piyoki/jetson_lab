FROM ubuntu:20.04

RUN apt-get update && apt upgrade -y 

# update timezone
ENV TZ=Asia/Shanghai
RUN echo $TZ > /etc/timezone && apt-get install -y tzdata && \
    dpkg-reconfigure tzdata 

# install softwares
RUN apt install -y python3 python3-pip python3-dev python3-setuptools libffi-dev \
    gcc make cmake g++ \
    git nano curl wget
RUN pip install pip -U
RUN ln -s /usr/bin/python3 /usr/bin/python && ln -s /usr/bin/pip3 /usr/bin/pip 
RUN pip install jupyterlab
RUN pip install --upgrade --force jupyter-console 
RUN echo 'export PATH=$PATH:~/.local/bin' >> ~/.bashrc

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - 
RUN apt install -y nodejs 
RUN jupyter lab build --minimize=False 

# set working dir
EXPOSE 8888
RUN mkdir -p /opt/app/data
WORKDIR /opt/app/data

RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.1/zsh-in-docker.sh)" -- \
    -t robbyrussell 

CMD [ "/bin/bash", "-c", "SHELL=zsh jupyter lab --ip=* --port=8888 --no-browser \
    --notebook-dir=/opt/app/data \
    --allow-root --NotebookApp.token='' \
    --NotebookApp.password='' " ]

# jupyter lab --ip=* --port=8888 --no-browser --notebook-dir=/opt/app/data --allow-root --NotebookApp.token='' --NotebookApp.password='' --LabApp.terminado_settings='{"shell_command": ["/bin/zsh"]}'
