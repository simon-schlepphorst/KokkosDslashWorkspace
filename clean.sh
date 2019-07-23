#!/bin/bash

pushd  ./build
rm -rf ./build_cpp_wilson_dslash
rm -rf ./build_kokkos_dslash
rm -rf ./build_libxml2
rm -rf ./build_qdp++-scalar
popd
 
pushd ./install
rm -rf ./cpp_wilson_dslash
rm -rf ./libxml2
rm -rf ./qdp++-scalar
popd
