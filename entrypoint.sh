#!/bin/sh -l

git_tag="${1}"
echo "This is the string provided as argument: ${git_tag}"

echo "This is the string from GITHUB_REF env var: ${GITHUB_REF}"

PYTHON=$(which python3)
$PYTHON /validate_version.py ${git_tag}

time=$(date)
echo "::set-output name=time::$time"

