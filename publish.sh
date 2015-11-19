#!/bin/bash

USAGE="Usage $0 <file.md>"

if [ "$#" -ne 1 ]; then
    echo $USAGE
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "File does not exist. $USAGE"
    exit 2
fi

pandoc --from markdown_github --to html --standalone "$1" --output "${1%%.*}.html"; ret=$?

if [ "$ret" -eq "0" ]; then
    htmldoc --cont --headfootsize 8.0 --linkcolor blue --linkstyle plain --format pdf14 "${1%%.*}.html" > "${1%%.*}.pdf"
fi
