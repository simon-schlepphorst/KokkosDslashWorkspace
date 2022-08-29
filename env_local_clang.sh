# my local setup

TOPDIR=`pwd`

BUILDDIR=${TOPDIR}/build/clang
INSTALLDIR=${TOPDIR}/install/clang
SRCDIR=${TOPDIR}/src

mkdir -p ${BUILDDIR}

PK_ARCH="x86_64-unknown-linux"
PK_CXX="clang++"
PK_CC="clang"
PK_OMP_ENABLE="--enable-openmp"
PK_CXXFLAGS="-g -O3 -std=c++14 -fopenmp -fopenmp=libomp -march=native"
PK_CXXFLAGS_NVCC=${PK_CXXFLAGS}" --expt-extended-lambda --expt-relaxed-constexpr"
PK_CFLAGS="-g -O3 -std=gnu99 -fopenmp -fopenmp=libomp" 

MAKE="make -j 2"
