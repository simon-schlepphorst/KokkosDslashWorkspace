#!/bin/bash

. ./env.sh

pushd ${SRCDIR}/cpp_wilson_dslash
autoreconf
popd

pushd ${BUILDDIR}

if [ -d ./build_cpp_wilson_dslash ]; 
then 
  rm -rf ./build_cpp_wilson_dslash
fi

mkdir  ./build_cpp_wilson_dslash
cd ./build_cpp_wilson_dslash


${SRCDIR}/cpp_wilson_dslash/configure \
	CC="${PK_CC}" \
	CXX="${PK_CXX}" \
	CFLAGS="${PK_CFLAGS}" \
	CXXFLAGS="${PK_CXXFLAGS}" \
	--enable-parallel-arch=scalar \
	--with-qdp=${INSTALLDIR}/qdp++-scalar \
	--prefix=${INSTALLDIR}/cpp_wilson_dslash \
	${PK_OMP_ENABLE}

${MAKE}
${MAKE} check
${MAKE} install
