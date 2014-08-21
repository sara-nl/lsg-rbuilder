Optimized OpenBLAS and R on the SURFsara Life Sciences Grid
===========================================================


Introduction
------------

The Life Sciences Grid has a basic set of packages supplied by Centos.
These packages are not optimized for the architecture of the compute
nodes of the life-sciences grid. For better performance, you need to
compile optimized versions of the software of choice yourself.

OpenBLAS can be optimized for the Bulldozer architecture on the Life
Science Grid compute nodes. If R has to be compiled against an optimzied
version of OpenBLAS, it *must* be compiled on the architecture it was
optimized for. This means that R cannot be compiled on the user interface
machines, because the user interfaces are virtual machines, which have a
limited CPU instruction set.

The solution is to compile OpenBLAS and R on the worker nodes, within a
job.


Compiling OpenBLAS and R
------------------------

This directory contains a script which downloads and compiles OpenBLAS
and R. It uses the most recent versions available at the time of writing:

# OpenBLAS version 0.2.10 (July 16, 2014)
# R version 3.1.1

The script should *not* be run on the user interface machines. Instead,
run the script as a grid job:

  qsub R-3.1.1-build-job.sh

This will download OpenBLAS and R, and install everything in 

  $HOME/opt/R-3.1.1


 
