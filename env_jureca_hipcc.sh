module load Autotools
module load CMake

TOPDIR=`pwd`

BUILDDIR=${TOPDIR}/build/hipcc
INSTALLDIR=${TOPDIR}/install/hipcc
SRCDIR=${TOPDIR}/src

mkdir -p ${BUILDDIR}

PK_ARCH="x86_64-unknown-linux"
PK_CXX="hipcc"
PK_CC="hipcc"
PK_OMP_ENABLE="--enable-openmp"
PK_CXXFLAGS="-g -O3 -std=c++14 -fopenmp -fopenmp=libomp -march=native"
PK_CFLAGS="-g -O3 -std=gnu99 -fopenmp -fopenmp=libomp" 

MAKE="make -j 48"
