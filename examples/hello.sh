#!/bin/bash
#PBS -lwalltime=0:01:00,nodes=1
#
# Submit with
#
#   qsub hello.sh
#
export PATH=$HOME/opt/R-3.1.1/bin:$PATH

# for the standard R on the life-sciences grid, set the number of OpenMP
# threads, because R is compiled using OpenMP. 
export OMP_NUM_THREADS=1

# for the R compiled against OpenBLAS, limit the number of threads to the
# number of claimed cores.
export OPENBLAS_NUM_THREADS=1

# if this script was started as a cluster job, the script starts in the
# user's home-directory, so change to the directory this script was submitted
# from
if [ -n "$PBS_O_WORKDIR" ]; then
  cd "$PBS_O_WORKDIR"
fi

# start the analysis
R --vanilla < hello.R

