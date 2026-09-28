#!/usr/bin/env bash

echo -e "\n\n================================================================"
echo "SciPy NelderMead"
julia call_optim_rosenbrock.jl scipy_optimize NelderMead

echo -e "\n\n================================================================"
echo "Optim.jl NelderMead"
julia call_optim_rosenbrock.jl optim_jl      NelderMead

echo -e "\n\n================================================================"
echo "SciPy BFGS"
julia call_optim_rosenbrock.jl scipy_optimize BFGS

echo -e "\n\n================================================================"
echo "Optim.jl BFGS"
julia call_optim_rosenbrock.jl optim_jl       BFGS
