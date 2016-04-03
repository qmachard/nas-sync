#!/usr/bin/env bash
sh sync-movies.sh >> ./log/movies.log &
sh sync-series.sh >> ./log/series.log &