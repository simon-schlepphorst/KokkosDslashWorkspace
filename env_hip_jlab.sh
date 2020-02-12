export PATH=/apps/gcc/8.1.0/bin:$PATH
export PATH=/apps/cmake/cmake-3.15.4/bin:$PATH
export PATH=/opt/rocm/bin:$PATH
export LD_LIBRARY_PATH=/apps/gcc/8.1.0/lib64:/apps/gcc/8.1.0/lib:/opt/rocm/lib64:/usr/lib64:$LD_LIBRARY_PATH

TOPDIR=`pwd`

BUILDDIR=${TOPDIR}/build
INSTALLDIR=${TOPDIR}/install
SRCDIR=${TOPDIR}/src

PK_CXX="g++"
PK_CC="gcc"
PK_OMP_ENABLE=""
PK_CXXFLAGS=" -g -O3 -std=c++11"
#PK_CXXFLAGS_NVCC=${PK_CXXFLAGS}" --expt-extended-lambda --expt-relaxed-constexpr"
PK_CXXFLAGS_NVCC="${PK_CXXFLAGS} --stdlib=libstdc++ -gcc-toolchain /apps/gcc/8.1.0 "
PK_CFLAGS="-g -O3 -std=gnu99"
PK_LDFLAGS="--stdlib=libstdc++ -gcc-toolchain /apps/gcc/8.1.0"
PK_LIBS=""

MAKE="make -j 8"


