FROM selenium/node-chrome-debug:3.141.59

USER root

# Benchmark Tools
RUN apt update && apt install -y x11-apps mesa-utils glmark2

# nvidia/cuda
LABEL maintainer "NVIDIA CORPORATION <cudatools@nvidia.com>"
ENV CUDA_VERSION 10.1.243
ENV CUDA_PKG_VERSION 10-1=$CUDA_VERSION-1

RUN apt-get update && apt-get install -y --no-install-recommends \
gnupg2 curl ca-certificates && \
    curl -fsSL https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub | apt-key add - && \
    echo "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64 /" > /etc/apt/sources.list.d/cuda.list && \
    echo "deb https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64 /" > /etc/apt/sources.list.d/nvidia-ml.list && \
    apt-get purge --autoremove -y curl && \
rm -rf /var/lib/apt/lists/*

# For libraries in the cuda-compat-* package: https://docs.nvidia.com/cuda/eula/index.html#attachment-a
RUN apt-get update && apt-get install -y --no-install-recommends \
        cuda-cudart-$CUDA_PKG_VERSION \
cuda-compat-10-1 && \
ln -s cuda-10.1 /usr/local/cuda && \
    rm -rf /var/lib/apt/lists/*

# Required for nvidia-docker v1
RUN echo "/usr/local/nvidia/lib" >> /etc/ld.so.conf.d/nvidia.conf && \
    echo "/usr/local/nvidia/lib64" >> /etc/ld.so.conf.d/nvidia.conf

# install VirtualGl
ENV VIRTUALGL_VERSION 2.6.3
RUN apt-get update && apt-get install -y \
    libglu1-mesa-dev mesa-utils wget xterm && \
    wget http://downloads.sourceforge.net/project/virtualgl/${VIRTUALGL_VERSION}/virtualgl_${VIRTUALGL_VERSION}_amd64.deb && \
    dpkg -i virtualgl*_amd64.deb  &&\
    /opt/VirtualGL/bin/vglserver_config -config +s +f -t && \
    rm virtualgl*_amd64.deb && \
    rm -rf /var/lib/apt/lists/*

# Xvfb Script Modication
# COPY docker/entry_point.sh /opt/bin/entry_point.sh
# COPY docker/start-xvfb.sh /opt/bin/start-xvfb.sh
# COPY docker/start-fluxbox.sh /opt/bin/start-fluxbox.sh
# COPY docker/start-selenium-node.sh /opt/bin/start-selenium-node.sh
# COPY docker/start-vnc.sh /opt/bin/start-vnc.sh

# Chrome Launch Script Modication
# COPY docker/vglrun-google-chrome /opt/google/chrome/google-chrome
# RUN chmod +x /opt/google/chrome/google-chrome

# Language
RUN apt update \
 && apt install -y locales tzdata language-pack-ja-base language-pack-ja fonts-noto-cjk \
 && apt clean && sudo apt autoclean \
 && rm -rf /var/lib/apt/lists/*

RUN locale-gen ja_JP.UTF-8 \
 && localedef -f UTF-8 -i ja_JP ja_JP.UTF-8 \
 && update-locale LANG=ja_JP.UTF-8 \
 && ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

USER seluser

ENV DISPLAY :0
ENV VGL_DISPLAY :0
ENV DBUS_SESSION_BUS_ADDRESS=/dev/null

# Nvidia Docker Links
LABEL com.nvidia.volumes.needed="nvidia_driver"
ENV PATH /opt/VirtualGL/bin:/usr/local/nvidia/bin:/usr/local/cuda/bin:${PATH}
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64

# Nvidia parameters
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,utility,graphics
ENV NVIDIA_REQUIRE_CUDA "cuda>=10.1 brand=tesla,driver>=384,driver<385 brand=tesla,driver>=396,driver<397 brand=tesla,driver>=410,driver<411"

