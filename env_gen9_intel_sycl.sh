#`module load clang-intel-sycl-latest
source /opt/intel/inteloneapi/setvars.sh

module load cmake-3.13.4

TOPDIR=`pwd`

BUILDDIR=${TOPDIR}/build
INSTALLDIR=${TOPDIR}/install
SRCDIR=${TOPDIR}/src

PK_CXX="clang++"
PK_CC="clang"
PK_OMP_ENABLE=""
PK_CXXFLAGS=" -g -O3 -std=c++14 -fsycl -fsycl-unnamed-lambda"
PK_CXXFLAGS_NVCC="${PK_CXXFLAGS}"
PK_CFLAGS="-g -O3 -std=gnu99 -fsycl -fsycl-unnamed-lambda"
PK_LDFLAGS="-fsycl -lOpenCL -lsycl"
MAKE="make -j 8"


