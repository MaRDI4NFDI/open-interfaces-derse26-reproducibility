# Reproducibility package for the manuscript for the deRSE'26 proceedings

This repository contains the reproducibility package for the manuscript
"MaRDI Open Interfaces for Interoperable Nonlinear Optimization"
submitted to the proceedings of the deRSE'26 conference.

# Usage

To provide a quick way of reproducing the computations from the manuscript,
we use [Docker](https://docker.com) which gives an ability to run
software inside isolated _containers_ without installing anything
directly on a given computer.

1. Build a Docker image that contains :

```shell
docker build -t mardi-oif-derse26-repro .
```
which will use the `Dockerfile` in this repro to build [MaRDI Open
Interfaces](https://github.com/MaRDI4NFDI/open-interfaces)
on the Ubuntu 24.04 operating system.
This will take some time (about 10 minutes) depending on your computer
and Internet bandwidth.

2. Start a container based on the built image:
```shell
docker run -it --rm mardi-oif-derse26-repro
```

3. Run all simulations (four in total) together:
```shell
./runall.sh
```
or alternatively run simulations one by one:
```shell
julia call_optim_rosenbrock.jl scipy_optimize NelderMead
julia call_optim_rosenbrock.jl optim_jl       NelderMead
julia call_optim_rosenbrock.jl scipy_optimize BFGS
julia call_optim_rosenbrock.jl optim_jl       BFGS
```
