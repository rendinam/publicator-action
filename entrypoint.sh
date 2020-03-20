#!/bin/sh -l

git_tag="${1}"
echo "This is the string provided: ${git_tag}"

PYTHON=$(which python3)
$PYTHON /validate_version.py ${git_tag}

time=$(date)
echo "::set-output name=time::$time"

