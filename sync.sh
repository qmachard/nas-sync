#!/usr/bin/env bash

ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ ! -d "${ROOT}/log/" ]
then
    mkdir -p "${ROOT}/log/"
fi

sh ${ROOT}/sync-movies.sh >> ${ROOT}/log/movies.log &
sh ${ROOT}/sync-series.sh >> ${ROOT}/log/series.log &