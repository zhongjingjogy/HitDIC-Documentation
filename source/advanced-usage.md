# Usage of HitDIC HPC

### How to access
This part contributes to using HitDIC in HPC cluster. Anyone who is intened to use HitDIC in personal computer, please refer to `Installation of HitDIC PC`. 

HitDIC HPC is currently not available online due to compliated runtime library over different Linux distributions. Anyone who is intended to use HPC version, please contact the developer and ask for help

### Usage on Paratera

[Paratera](https://www.paratera.com/) is one of the HPC service provider in China, who provide assessible computing resources on `Tianhe` and other HPC cluster. Anyone who is interested in these computing resource, please contact `Paratera` or just ask the developer for help.

The batch file for runing a HitDIC optimizer on HPC reads like the following
```
#!/bin/bash
#SBATCH --job-name=hitdictask
#SBATCH -N 1
#SBATCH -n 24
#SBATCH --time=2:00:00

source /PARA/app/scripts/cn-module.sh
module load cmake/3.12.3-gcc-5.4.0
module load intel-compilers/2018
module load boost/1.63.0-gcc540
module load MPI/Intel/MPICH/3.2-icc2018-dyn
export PATH=/PARA/blsc273/local/hitdicv2.4:$PATH

srun hitdicmpi-ga
```