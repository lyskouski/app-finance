#!/bin/bash

while getopts v: flag
do
    case "${flag}" in
        v) version=${OPTARG};;
    esac
done

dir=$(pwd -P | sed 's/\//\\\//g')

sed -i "s/version: 1.0.0/version: $version/g" AppImageBuilder.yml
sed -i "s/path: AppDir/path: $dir\/AppDir/g" AppImageBuilder.yml

cp fingrom-launcher.sh AppDir/fingrom-launcher.sh
chmod +x AppDir/fingrom-launcher.sh
