#!/bin/bash
#SBATCH --job-name=nita
#SBATCH -N 2
#SBATCH -n 48

module load mpi/mpich/3.3.1-icc19
module load intel/19.0.3
module load cmake/3.12
module load gcc/5.4.0
export LD_LIBRARY_PATH=/public1/home/sc30342/local/boost_1_63/lib:$LD_LIBRARY_PATH
export PATH=/public1/home/sc30342/local/bin:$PATH

srun mcmc-multichains
