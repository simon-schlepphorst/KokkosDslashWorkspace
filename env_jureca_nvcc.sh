module load Autotools
module load CMake
module load NVHPC
module load CUDA

TOPDIR=`pwd`

BUILDDIR=${TOPDIR}/build/nvcc
INSTALLDIR=${TOPDIR}/install/nvcc
SRCDIR=${TOPDIR}/src

mkdir -p ${BUILDDIR}

PK_ARCH="x86_64-unknown-linux"
PK_CXX="g++"
PK_CC="gcc"
PK_OMP_ENABLE="--enable-openmp"
PK_CXXFLAGS="-g -O3 -fopenmp -march=native"
PK_CXXFLAGS_NVCC=${PK_CXXFLAGS}" --expt-extended-lambda --expt-relaxed-constexpr"
PK_CFLAGS="-g -O3 -std=gnu99 -fopenmp" 
PK_LDFLAGS="-fopenmp"
PK_LIBS=""

MAKE="make -j 32"
