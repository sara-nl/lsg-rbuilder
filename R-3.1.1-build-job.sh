#!/bin/bash
#PBS -lwalltime=2:00:00

# This script downloads OpenBLAS and R-3.1.1, and compiles
# and installs R linked against an optimized version of OpenBLAS.
# 2014-08-21, L. Voort <lykle.voort@surfsara.nl>
#   - removed readline dependency
# 2014-08-20, L. Voort <lykle.voort@surfsara.nl>
#   - set NO_AFFINITY=1
# 2014-08-19, L. Voort <lykle.voort@surfsara.nl>

# start in the user's home directory
PREFIX=$HOME/opt/R-3.1.1

(

mkdir r-build
cd r-build

# build and install openblas
git clone git://github.com/xianyi/OpenBLAS
cd OpenBLAS
make TARGET=BULLDOZER FC=gfortran PREFIX=$PREFIX NO_AFFINITY=1
make TARGET=BULLDOZER FC=gfortran PREFIX=$PREFIX NO_AFFINITY=1 install
cd ..

# build and install R-3.1.1
wget http://cran-mirror.cs.uu.nl/src/base/R-3/R-3.1.1.tar.gz
tar xfvz R-3.1.1.tar.gz
cd R-3.1.1

FC=gfortran CFLAGS="-I$PREFIX/include"                            \
  LDFLAGS="-L$PREFIX/lib"                                         \
  ./configure --prefix=$PREFIX                                    \
  --with-blas="-lopenblas" --with-lapack="-lopenblas"             \
  --with-x=no --with-readline=no

make
make install
cd ..

) > compile.log 2>&1
