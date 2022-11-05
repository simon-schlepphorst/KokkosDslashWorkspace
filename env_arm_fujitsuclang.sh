module load cmake/3.24.2_arm
module load fuji

TOPDIR=`pwd`

BUILDDIR=${TOPDIR}/build/clang
INSTALLDIR=${TOPDIR}/install/clang
SRCDIR=${TOPDIR}/src

PK_ARCH="aarch64-unknown-linux"
PK_CXX="FCC -Nclang"
PK_CC="fcc -Nclang"
PK_OMP_ENABLE="--enable-openmp"
PK_CXXFLAGS=" -g -O3 -std=c++14 -fopenmp -march=native"
PK_CFLAGS="-g -O3 -std=gnu99 -fopenmp"
PK_LDFLAGS=""

MAKE="make -j 42 -i"
