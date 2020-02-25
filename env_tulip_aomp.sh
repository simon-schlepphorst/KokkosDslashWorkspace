module load aomp

TOPDIR=`pwd`

BUILDDIR=${TOPDIR}/build
INSTALLDIR=${TOPDIR}/install
SRCDIR=${TOPDIR}/src

PK_CXX="clang++"
PK_CC="clang"
PK_OMP_ENABLE=""
PK_CXXFLAGS=" -g -O3 -std=c++11 -fopenmp -fopenmp=libomp -Xopenmp-target=amdgcn-amd-amdhsa -march=gfx900 -fopenmp-targets=amdgcn-amd-amdhsa"
#PK_CXXFLAGS_NVCC=${PK_CXXFLAGS}" --expt-extended-lambda --expt-relaxed-constexpr"
PK_CXXFLAGS_NVCC="${PK_CXXFLAGS}"
PK_CFLAGS="-g -O3 -std=gnu99 -fopenmp -fopenmp=libomp -Xopenmp-target=amdgcn-amd-amdhsa -march=gfx900 -fopenmp-targets=amdgcn-amd-amdhsa"
MAKE="make -j 8"


