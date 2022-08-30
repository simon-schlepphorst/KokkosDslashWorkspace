#!/bin/bash

source ./env.sh
export PK_MODULE=kokkos_dslash_mdrange

pushd ${BUILDDIR}
if [ -d ./build_${PK_MODULE}  ];
then
  rm -rf ./build_${PK_MODULE}
fi

mkdir  ./build_${PK_MODULE}
cd ./build_${PK_MODULE}


cmake \
    -DCMAKE_CXX_COMPILER=${PK_CXX} \
    -DCMAKE_CXX_FLAGS="${PK_CXXFLAGS}" \
    -DCMAKE_C_COMPILER=${PK_CC} \
    -DCMAKE_C_FLAGS="${PK_CFLAGS}" \
    -DCMAKE_EXE_LINKER_FLAGS="${PK_LDFLAGS}" \
    -DQDPXX_DIR="${INSTALLDIR}/qdp++-scalar/share" \
    -DCMAKE_CXX_COMPILER=${PK_CXX} \
    -DKokkos_ENABLE_HIP=ON \
    -DKokkos_ARCH_VEGA90A=ON \
    -DKokkos_ENABLE_OPENMP=ON \
    -DKokkos_ENABLE_SERIAL=ON \
    -DKokkos_ARCH_ZEN3=ON \
    -DKokkos_ENABLE_COMPLEX_ALIGN=ON \
    -DMG_KOKKOS_USE_MDRANGE=ON \
    -DMG_USE_HIP=ON \
    -DMG_USE_AVX2=OFF \
    -DMG_DEFAULT_LOGLEVEL=DEBUG \
     ${SRCDIR}/KokkosDslash


${MAKE}
