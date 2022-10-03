#!/usr/bin/env sh

N_PROCESS=${N_PROCESS:-1}

flutter test -j $N_PROCESS "$@"

