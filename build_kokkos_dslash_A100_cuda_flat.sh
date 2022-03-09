#!/bin/bash

source ./env.sh
export PK_MODULE=kokkos_dslash

NVCC_WRAPPER=${SRCDIR}/KokkosDslash/extern/kokkos/bin/nvcc_wrapper
chmod u+x ${NVCC_WRAPPER}
export CXX=${NVCC_WRAPPER}


pushd ${BUILDDIR}
if [ -d ./build_${PK_MODULE}  ];
then
  rm -rf ./build_${PK_MODULE}
fi

mkdir  ./build_${PK_MODULE}
cd ./build_${PK_MODULE}


cmake \
    -G"Eclipse CDT4 - Unix Makefiles" \
    -DKokkos_ENABLE_OPENMP=ON \
    -DKokkos_ENABLE_CUDA=ON \
    -DKokkos_ENABLE_CUDA_LAMBDA=ON \
    -DKokkos_ENABLE_DEPRECATED_CODE=FALSE \
    -DKokkos_ENABLE_PROFILING=ON \
    -DKokkos_ENABLE_SERIAL=ON \
    -DKokkos_ARCH_AMPERE80=ON \
    -DCMAKE_ECLIPSE_MAKE_ARGUMENTS=-j8 \
    -DCMAKE_ECLIPSE_VERSION=4.5.0 \
    -DQDPXX_DIR=${INSTALLDIR}/qdp++-scalar/share \
    -DMG_DEFAULT_LOGLEVEL=DEBUG \
    -DCMAKE_CXX_FLAGS="${PK_CXXFLAGS_NVCC} -arch=sm_80" \
    -DCMAKE_EXE_LINKER_FLAGS="${PK_LDFLAGS}" \
    -DMG_FLAT_PARALLEL_DSLASH=ON \
    -DMG_USE_AVX512=OFF \
    -DMG_USE_AVX2=OFF \
    -DMG_USE_CUDA=ON \
     ${SRCDIR}/KokkosDslash 


${MAKE} -j 8
