#!/bin/sh

. ./config/config.ini

list="./config/series.txt"

function sync_folder {
    local distant_folder
    local local_folder

    distant_folder=${SEEDBOX_PATH_SERIES}$1
    local_folder=${LOCAL_PATH_SERIES}$1

    # Create folder if not exists
    if [ ! -d "${local_folder}" ]; then
        mkdir -p "${local_folder}"
    fi

    # Escape spaces
    distant_folder=$( echo "${distant_folder}" | sed 's/ /\\ /g' )

    rsync -azv "${SEEDBOX_USER}"@"${SEEDBOX_HOST}":"${distant_folder}" "${local_folder}"
}

while read line
do
   sync_folder "${line}"
done < ${list}