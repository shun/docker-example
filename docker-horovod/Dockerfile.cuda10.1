FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu18.04

RUN apt update \
	&& apt install --allow-change-held-packages -y \
		libnccl2=2.4.7-1+cuda10.1 \
		libnccl-dev=2.4.7-1+cuda10.1 \
		vim \
		curl \
		htop \
		tmux \
		python \
		python3 \
		python-pip \
		python3-pip \
		python-dev \
		python3-dev 

RUN apt install -y \
	infiniband-diags opensm ibverbs-utils infiniband-diags perftest

RUN apt install -y \
	 libnccl2=2.4.7-1+cuda10.1 libnccl-dev=2.4.7-1+cuda10.1

RUN curl -L https://download.open-mpi.org/release/open-mpi/v4.0/openmpi-4.0.1.tar.gz -o /tmp/openmpi-4.0.1.tar.gz \
	&& cd /tmp \
	&& tar -zxvf /tmp/openmpi-4.0.1.tar.gz \
	&& cd /tmp/openmpi-4.0.1 \
	&& ./configure --with-cuda --prefix=$HOME/local/openmpi --with-openib \
	&& make -j2 \
	&& make install

RUN echo 'export LD_LIBRARY_PATH=$HOME/local/openmpi/lib:${LD_LIBRARY_PATH}' >> ~/.bashrc \
	&& echo 'export PATH=$HOME/local/openmpi/bin:${PATH}' >> ~/.bashrc

RUN apt install -y \
	build-essential \
	libssl-dev \
	libreadline-dev \
	zlib1g-dev \
	language-pack-ja \
	openssh-server \
	&& mkdir /var/run/sshd

ARG USERNAME=dev
RUN useradd -m $USERNAME && echo "$USERNAME:$USERNAME" | chpasswd && gpasswd -a $USERNAME sudo \
	&& mkdir -p /home/$USERNAME/.ssh \
	&& chmod 700 /home/$USERNAME/.ssh \
	&& passwd -d root \
	&& passwd -d $USERNAME

RUN sed -i -e 's/^#Port 22$/Port 50022/' /etc/ssh/sshd_config

RUN rm -rf /var/lib/apt/lists/*

