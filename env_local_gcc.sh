# my local setup

TOPDIR=`pwd`

BUILDDIR=${TOPDIR}/build/gcc
INSTALLDIR=${TOPDIR}/install/gcc
SRCDIR=${TOPDIR}/src

mkdir -p ${BUILDDIR}

PK_ARCH="x86_64-unknown-linux"
PK_CXX="g++"
PK_CC="gcc"
PK_OMP_ENABLE="--enable-openmp"
PK_CXXFLAGS="-g -O3 -std=c++14 -fopenmp -march=native"
PK_CXXFLAGS_NVCC=${PK_CXXFLAGS}" --expt-extended-lambda --expt-relaxed-constexpr"
PK_CFLAGS="-g -O3 -std=gnu99 -fopenmp" 
PK_LDFLAGS="-fopenmp"
PK_LIBS=""

MAKE="make -j 2"
