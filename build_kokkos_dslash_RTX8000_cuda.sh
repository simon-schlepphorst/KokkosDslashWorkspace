#!/bin/bash

source ./env.sh
export PK_MODULE=kokkos_dslash_team

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
    -DQDPXX_DIR=${INSTALLDIR}/qdp++-scalar/share \
    -DKokkos_ENABLE_OPENMP=ON \
    -DKokkos_ENABLE_CUDA=ON \
    -DKokkos_ENABLE_CUDA_LAMBDA=ON \
    -DKokkos_ENABLE_SERIAL=ON \
    -DKokkos_ARCH_TURING75=ON \
    -DCMAKE_CXX_FLAGS="${PK_CXXFLAGS_NVCC} -arch=sm_75" \
    -DCMAKE_EXE_LINKER_FLAGS="${PK_LDFLAGS}" \
    -DMG_USE_AVX512=OFF \
    -DMG_USE_AVX2=OFF \
    -DMG_USE_CUDA=ON \
    -DMG_DEFAULT_LOGLEVEL=DEBUG \
     ${SRCDIR}/KokkosDslash 


${MAKE}
