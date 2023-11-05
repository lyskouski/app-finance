#!/bin/bash

while getopts v:i:s: flag
do
    case "${flag}" in
        v) version=${OPTARG};;
        i) id=${OPTARG};;
        s) hash=${OPTARG};;
    esac
done

date=$(date '+%Y-%m-%d')

sed -i s/{VERSION}/$version/g com.tercad.fingrom.yml
sed -i s/{SHA256}/$hash/g com.tercad.fingrom.yml

sed -i s/{VERSION}/$version/g com.tercad.fingrom.metainfo.xml
sed -i s/{COMMIT}/$id/g com.tercad.fingrom.metainfo.xml
sed -i s/{DATE}/$date/g com.tercad.fingrom.metainfo.xml
