#!/bin/bash
MB=$(free | grep Mem | tr -s ' ' | cut -d ' ' -f 4);
ARRAYSIZE=$(( $MB * 40 ));

gcc -fstrict-aliasing -mcmodel=large -Ofast -mtune=native -march=native -fopenmp /usr/src/stream/stream.c -DSTREAM_ARRAY_SIZE=$ARRAYSIZE -o stream-gcc

CORESPERSOCKET=$(lscpu | grep "per socket" | tr -s ' ' | cut -d ' ' -f4);
SOCKETS=$(lscpu | grep Socket | tr -s ' ' | cut -d ' ' -f2);

export OMP_NUM_THREADS=$(( $CORESPERSOCKET * $SOCKETS ));
export GOMP_CPU_AFFINITY="0-$(($OMP_NUM_THREADS - 1))"
 ./stream-gcc
