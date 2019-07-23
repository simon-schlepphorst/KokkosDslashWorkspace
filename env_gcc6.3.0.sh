. /usr/share/Modules/init/bash
module load gcc-6.3.0
module load cmake-3.13.4

TOPDIR=`pwd`

BUILDDIR=${TOPDIR}/build
INSTALLDIR=${TOPDIR}/install
SRCDIR=${TOPDIR}/src

PK_CXX="g++"
PK_CC="gcc"
PK_OMP_ENABLE="--enable-openmp"

PK_CXXFLAGS="-g -O3 -std=c++14 -fopenmp -march=native"
PK_CFLAGS="-g -O3 -std=gnu99 -fopenmp" 
PK_LDFLAGS=""
PK_LIBS=""

OMPENABLE=""
MAKE="make -j 8"


