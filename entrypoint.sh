#!/bin/bash -e

ksrc_dir=/usr/src/linux-source-4.19
prog_dir=$ksrc_dir/bpfprog
rm -rf $prog_dir
mkdir -p $prog_dir
cp /Makefile-bpf $prog_dir/Makefile
cp -r /src $prog_dir
pushd $prog_dir
mv src/$1 src/a.c
make
popd
cp $prog_dir/src/a.o /src/$(basename $1 .c).o
