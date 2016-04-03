#!/bin/sh

. ./config/config.ini

list="./config/series.txt"

function sync_folder {
    local distant_folder
    local local_folder

    distant_folder=${SEEDBOX_PATH_SERIES}$1
    local_folder=${LOCAL_PATH_SERIES}$1

    echo "\n$1\n";

    # Create folder if not exists
    if [ ! -d "${local_folder}" ]; then
        mkdir -p "${local_folder}"
    fi

    # Escape spaces
    distant_folder=$( echo "${distant_folder}" | sed 's/ /\\ /g' )

    rsync -azv "${SEEDBOX_USER}"@"${SEEDBOX_HOST}":"${distant_folder}" "${local_folder}"
}

# Is already launch
if test -f /tmp/sync-series
then
	echo "[Error] This script is already running"
	exit 3
else
	touch /tmp/sync-series
fi

echo "\n######## Starting sync series\n"

while read line
do
   sync_folder "${line}"
done < ${list}

echo "\n######## Ending sync series\n"

rm /tmp/sync-series
