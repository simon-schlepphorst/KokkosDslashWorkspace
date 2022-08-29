module load cmake/3.19-arm
module load gcc/11.1

TOPDIR=`pwd`

BUILDDIR=${TOPDIR}/build
INSTALLDIR=${TOPDIR}/install
SRCDIR=${TOPDIR}/src

PK_ARCH="aarch64-unknown-linux"
PK_CXX="g++"
PK_CC="gcc"
PK_OMP_ENABLE="--enable-openmp"
PK_CXXFLAGS=" -g -O3 -std=c++14 -fopenmp -march=native"
PK_CFLAGS="-g -O3 -std=gnu99 -fopenmp"
PK_LDFLAGS=""

MAKE="make -j 8"
