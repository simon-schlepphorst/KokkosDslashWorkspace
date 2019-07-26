TOPDIR=`pwd`

BUILDDIR=${TOPDIR}/build
INSTALLDIR=${TOPDIR}/install
SRCDIR=${TOPDIR}/src

PK_CXX="g++"
PK_CC="gcc"
PK_OMP_ENABLE="--enable-openmp"

PK_CXXFLAGS="-O3 -std=c++14 -fopenmp -march=native"
PK_CFLAGS="-O3 -std=c99 -fopenmp" 
PK_LDFLAGS=""
PK_LIBS=""

MAKE="make -j 4"


