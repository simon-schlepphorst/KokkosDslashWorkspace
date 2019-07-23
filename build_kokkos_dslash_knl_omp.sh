source ./env.sh

pushd ${BUILDDIR}

export PK_MODULE=kokkos_dslash

if [ -d ./build_${PK_MODULE}  ];
then
  rm -rf ./build_${PK_MODULE}
fi

mkdir  ./build_${PK_MODULE}
cd ./build_${PK_MODULE}


#export OMPI_CXX=$HOME/bin/nvcc_wrapper
CXX="${PK_CXX}" CC="${PK_CC}" CXXFLAGS="${PK_CXXFLAGS}" cmake \
    -G"Eclipse CDT4 - Unix Makefiles" \
    -DCMAKE_ECLIPSE_MAKE_ARGUMENTS=-j8 \
    -DCMAKE_ECLIPSE_VERSION=4.5.0 \
    -DKOKKOS_ENABLE_OPENMP="ON" \
    -DKOKKOS_ARCH="KNL" \
    -DQDPXX_DIR=${INSTALLDIR}/qdp++-scalar/share \
    -DMG_DEFAULT_LOGLEVEL=DEBUG \
    -DMG_USE_AVX512=ON \
    -DMG_USE_AVX2=OFF \
    -DCMAKE_BUILD_TYPE=DEBUG \
     ${SRCDIR}/KokkosDSlash

${MAKE}
