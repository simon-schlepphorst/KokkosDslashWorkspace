#!/bin/bash

source ./env.sh
export PK_MODULE=kokkos_dslash

#NVCC_WRAPPER=${SRCDIR}/KokkosDslash/extern/kokkos/bin/hip_wrapper
#chmod u+x ${NVCC_WRAPPER}
export NVCC_WRAPPER=hipcc
export CXX=${NVCC_WRAPPER}


pushd ${BUILDDIR}
if [ -d ./build_${PK_MODULE}  ];
then
  rm -rf ./build_${PK_MODULE}
fi

mkdir  ./build_${PK_MODULE}
cd ./build_${PK_MODULE}


cmake3 \
    -G"Eclipse CDT4 - Unix Makefiles" \
    -DCMAKE_CXX_COMPILER=hipcc \
    -DKokkos_ENABLE_OPENMP=FALSE \
    -DKokkos_ENABLE_HIP=TRUE \
    -DKokkos_ENABLE_DEPRECATED_CODE=FALSE \
    -DKokkos_ENABLE_PROFILING=OFF \
    -DKokkos_ENABLE_SERIAL=ON \
    -DKokkos_ARCH_GFX906=ON \
    -DKokkos_ARCH_EPYC=ON \
    -DKokkos_ENABLE_COMPLEX_ALIGN=ON \
    -DCMAKE_ECLIPSE_MAKE_ARGUMENTS=-j8 \
    -DCMAKE_ECLIPSE_VERSION=4.5.0 \
    -DQDPXX_DIR=${INSTALLDIR}/qdp++-scalar/share \
    -DMG_DEFAULT_LOGLEVEL=DEBUG \
    -DCMAKE_CXX_FLAGS="${PK_CXXFLAGS_NVCC}" \
    -DCMAKE_EXE_LINKER_FLAGS="${PK_LDFLAGS}" \
    -DMG_FLAT_PARALLEL_DSLASH=ON \
    -DMG_KOKKOS_USE_MDRANGE=OFF \
    -DMG_USE_AVX512=OFF \
    -DMG_USE_AVX2=OFF \
    -DMG_USE_CUDA=OFF \
    -DMG_USE_HIP=ON \
     ${SRCDIR}/KokkosDslash 


${MAKE} -j 8
