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
