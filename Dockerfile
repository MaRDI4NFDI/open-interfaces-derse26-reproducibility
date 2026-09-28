FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    curl \
    git \
    build-essential \
    cmake \
    pkg-config \
    libffi-dev \
    python3 \
    python3-pip \
    python3-venv

# Set up Python (version 3.12).
RUN python3 -m venv venv && \
    . venv/bin/activate && \
    python3 -m pip install numpy==2.5 scipy==1.18 msgpack==1.2

# Set up Julia
RUN curl -O https://julialang-s3.julialang.org/bin/linux/x64/1.11/julia-1.11.9-linux-x86_64.tar.gz && \
    tar xzf julia-1.11.9-linux-x86_64.tar.gz -C /opt && \
    ln -sv /opt/julia-1.11.9/bin/julia  /usr/local/bin/

# Get Open Interfaces
RUN curl -LO https://github.com/MaRDI4NFDI/open-interfaces/archive/refs/tags/v0.7.1.tar.gz && \
    tar xzf v0.7.1.tar.gz

WORKDIR /open-interfaces-0.7.1

RUN julia --project=. -e 'using Pkg; Pkg.instantiate()'

RUN . /venv/bin/activate && make release

COPY call_optim_rosenbrock.jl runall.sh ./

# Set up environment
RUN echo "source /venv/bin/activate" >> /etc/bash.bashrc && \
    echo "source /open-interfaces-0.7.1/env.sh" >> /etc/bash.bashrc
