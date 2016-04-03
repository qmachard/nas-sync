#!/usr/bin/env bash

ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Stopping movies
pkill -f ${ROOT}/sync-movies.sh
echo "######## Process killed" >> ${ROOT}/log/movies.log
rm /tmp/sync-movies

# Stopping series
pkill -f ${ROOT}/sync-series.sh
echo "######## Process killed" >> ${ROOT}/log/series.log
rm /tmp/sync-series

# Stopping current sync
pkill -f rsync