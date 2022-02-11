FROM nvcr.io/nvidia/cuda:11.0.3-cudnn8-devel-ubuntu18.04
ENV http_proxy=http://172.24.206.4:3128
ENV https_proxy=http://172.24.206.4:3128

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y  \
    git wget sudo build-essential \
    python3 python3-setuptools python3-pip python3-dev python3-tk \
    ffmpeg libsm6 libxext6
RUN ln -svf /usr/bin/python3 /usr/bin/python
RUN python -m pip install --upgrade --force pip

# TensorRT
ARG version="8.0.5.39-1+cuda11.0"
RUN apt-get update && apt-get install -y libcudnn8=${version} libcudnn8-dev=${version} && apt-mark hold libcudnn8 libcudnn8-dev
ARG version="7.2.3-1+cuda11.0"
RUN apt-get update && \
    apt-get install -y libnvinfer7=${version} libnvonnxparsers7=${version} libnvparsers7=${version} libnvinfer-plugin7=${version} libnvinfer-dev=${version} libnvonnxparsers-dev=${version} libnvparsers-dev=${version} libnvinfer-plugin-dev=${version} python3-libnvinfer=${version} && \
    apt-mark hold libnvinfer7 libnvonnxparsers7 libnvparsers7 libnvinfer-plugin7 libnvinfer-dev libnvonnxparsers-dev libnvparsers-dev libnvinfer-plugin-dev python3-libnvinfer

# create a non-root user
ARG GROUP_ID=10000
ARG GROUP=oppous
ARG USER_ID=1000110
ARG USER=us000110
RUN groupadd -g ${GROUP_ID} ${GROUP} \
    && useradd -m --no-log-init --system --uid ${USER_ID} ${USER} -g ${GROUP}
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# # Install dependencies
RUN pip install cython opencv-python pillow matplotlib GitPython termcolor tensorboard
RUN pip install git+https://github.com/haotian-liu/cocoapi.git#"egg=pycocotools&subdirectory=PythonAPI"
RUN pip install torch==1.7.1+cu110 torchvision==0.8.2+cu110 -f https://download.pytorch.org/whl/torch_stable.html

# torch2trt
# Seems that the original version of Dockerfile forget to install packaging which is needed in installing torch2trt
RUN pip install packaging

USER ${USER}
WORKDIR /home/${USER}
ENV PATH="/home/${USER}/.local/bin:${PATH}"

RUN git clone https://github.com/NVIDIA-AI-IOT/torch2trt
WORKDIR /home/${USER}/torch2trt
RUN python setup.py install --plugins --user
WORKDIR /home/${USER}
RUN rm -rf torch2trt 
# RUN ln -s /yolact_edge
# RUN ln -s /datasets
# WORKDIR /home/${USER}/yolact_edge

ENV LANG C.UTF-8
