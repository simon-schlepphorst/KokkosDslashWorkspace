source /dist/intel/parallel_studio_2019/parallel_studio_xe_2019/psxevars.sh intel64

TOPDIR=`pwd`

BUILDDIR=${TOPDIR}/build
INSTALLDIR=${TOPDIR}/install
SRCDIR=${TOPDIR}/src

PK_CXX="icpc"
PK_CC="icc"
PK_OMP_ENABLE="--enable-openmp"

PK_CXXFLAGS="-O3 -std=c++14 -qopenmp -xCORE-AVX2"
PK_CFLAGS="-O3 -std=c99 -qopenmp" 
PK_LDFLAGS=""
PK_LIBS=""

OMPENABLE=""
MAKE="make -j 8"


