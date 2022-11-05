#!/bin/bash

source ./env.sh
export PK_MODULE=kokkos_dslash


pushd ${BUILDDIR}
if [ -d ./build_${PK_MODULE}  ];
then
  rm -rf ./build_${PK_MODULE}
fi

mkdir  ./build_${PK_MODULE}
cd ./build_${PK_MODULE}


cmake \
    -DCMAKE_CXX_COMPILER="${PK_CXX}" \
    -DKokkos_ENABLE_OPENMP=ON \
    -DKokkos_ENABLE_SERIAL=ON \
    -DKokkos_ENABLE_COMPLEX_ALIGN=ON \
    -DKokkos_ARCH_A64FX=ON \
    -DQDPXX_DIR=${INSTALLDIR}/qdp++-scalar/share \
    -DMG_DEFAULT_LOGLEVEL=DEBUG \
    -DCMAKE_CXX_FLAGS="${PK_CXXFLAGS}" \
    -DCMAKE_EXE_LINKER_FLAGS="${PK_LDFLAGS}" \
    -DMG_FLAT_PARALLEL_DSLASH=OFF \
    -DMG_KOKKOS_USE_MDRANGE=ON \
    -DMG_USE_SVE512=ON \
    -DMG_USE_AVX512=OFF \
    -DMG_USE_AVX2=OFF \
    -DMG_USE_CUDA=OFF \
    -DMG_USE_HIP=OFF \
    -DMG_USE_OPENMP_TARGET=OFF \
     ${SRCDIR}/KokkosDslash


${MAKE} VERBOSE=1
