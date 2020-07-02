#!/bin/sh -l

echo "--Entrypoint begin"
pwd

REF=$GITHUB_REF
echo "This is the string from GITHUB_REF env var: ${REF}"

PYTHON=$(which python3)
$PYTHON /validate_version.py ${REF}

time=$(date)
echo "::set-output name=time::$time"
echo "--Entrypoint end"

