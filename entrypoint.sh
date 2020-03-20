#!/bin/sh -l

echo "This is the string provided: $1"

PYTHON=$(which python3)
$PYTHON /validate_version.py

time=$(date)
echo "::set-output name=time::$time"


