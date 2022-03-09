module load Autotools
module load CMake
module load NVHPC
module load CUDA

TOPDIR=`pwd`

BUILDDIR=${TOPDIR}/build
INSTALLDIR=${TOPDIR}/install
SRCDIR=${TOPDIR}/src

#export CPLUS_INCLUDE_PATH=${TOPDIR}/install/qdp++-scalar/include:${TOPDIR}/src/qdpxx/other_libs/xpath_reader/include
#export LIBRARY_PATH=${TOPDIR}/install/qdp++-scalar/lib

#export PATH=$PATH:${TOPDIR}/install/libxml2/bin

PK_CXX="g++"
PK_CC="gcc"
PK_OMP_ENABLE="--enable-openmp"
PK_CXXFLAGS="-g -O3 -fopenmp -march=native"
PK_CXXFLAGS_NVCC=${PK_CXXFLAGS}" --expt-extended-lambda --expt-relaxed-constexpr"
PK_CFLAGS="-g -O3 -std=gnu99 -fopenmp" 
PK_LDFLAGS="-fopenmp"
PK_LIBS=""

MAKE="make -j 8"

