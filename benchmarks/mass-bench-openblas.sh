#!/bin/bash
#PBS -lwalltime=0:01:00,nodes=1:ppn=1

export PATH=$HOME/opt/R-3.1.1/bin:$PATH
export RHOME=$HOME/opt/R-3.1.1

if [ -n "$PBS_O_WORKDIR" ]; then
  cd $PBS_O_WORKDIR;
fi

export OPENBLAS_NUM_THREADS=1

(
  time -p R --vanilla CMD BATCH MASS-ex.R /dev/null
) > time-mass-bench-openblas.txt 2>&1

