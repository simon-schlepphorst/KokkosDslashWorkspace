module load 

NVCC_WRAPPER=${SRCDIR}/KokkosDslash/extern/kokkos/bin/nvcc_wrapper
chmod u+x ${NVCC_WRAPPER}
export CXX=${NVCC_WRAPPER}

cmake \
    -G"Eclipse CDT4 - Unix Makefiles" \
    -DKOKKOS_ENABLE_CUDA=TRUE \
    -DCMAKE_ECLIPSE_MAKE_ARGUMENTS=-j8 \
    -DCMAKE_ECLIPSE_VERSION=4.5.0 \
    -DKOKKOS_HOST_ARCH="SNB" \
    -DKOKKOS_GPU_ARCH="Kepler37" \
    -DQDPXX_DIR=${INSTALL_DIR}/qdp++-scalar \
    -DMG_DEFAULT_LOGLEVEL=DEBUG \
     ${SRCDIR}/KokkosDslash 



