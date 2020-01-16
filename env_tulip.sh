module load gcc
module load rocm-alt

TOPDIR=`pwd`

BUILDDIR=${TOPDIR}/build
INSTALLDIR=${TOPDIR}/install
SRCDIR=${TOPDIR}/src

PK_CXX="g++"
PK_CC="gcc"
PK_OMP_ENABLE=""
PK_CXXFLAGS=" -g -O3 -std=c++11"
#PK_CXXFLAGS_NVCC=${PK_CXXFLAGS}" --expt-extended-lambda --expt-relaxed-constexpr"
PK_CXXFLAGS_NVCC="${PK_CXXFLAGS} --amdgpu-target=gfx906 "
PK_CFLAGS="-g -O3 -std=gnu99"
PK_LDFLAGS="-amdgpu-target=gfx906"
PK_LIBS=""

MAKE="make -j 8"


