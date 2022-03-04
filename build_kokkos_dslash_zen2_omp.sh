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
    -DCMAKE_CXX_COMPILER=${PK_CXX} \
    -DKokkos_ENABLE_OPENMP=ON \
    -DKokkos_ENABLE_DEPRECATED_CODE=FALSE \
    -DKokkos_ENABLE_PROFILING=ON \
    -DKokkos_ENABLE_SERIAL=ON \
    -DKokkos_ARCH_ZEN2=ON \
    -DKokkos_ENABLE_COMPLEX_ALIGN=ON \
    -DQDPXX_DIR=${INSTALLDIR}/qdp++-scalar/share \
    -DMG_DEFAULT_LOGLEVEL=DEBUG \
    -DCMAKE_CXX_FLAGS="${PK_CXXFLAGS}" \
    -DCMAKE_EXE_LINKER_FLAGS="${PK_LDFLAGS}" \
     ${SRCDIR}/KokkosDslash


${MAKE} VERBOSE=1
