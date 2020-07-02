#!/bin/sh -l

echo "--Entrypoint begin"
echo "Custom working directory: $(pwd)"

REF=$GITHUB_REF
echo "This is the string from GITHUB_REF env var: ${REF}"

PYTHON=$(which python3)
PIP=$(which pip3)
echo "PIP=${PIP}"

$PYTHON --version
$PYTHON /validate_version.py ${REF}

time=$(date)

echo "Install package"
$PIP install .

echo "Install publication deps"
$PIP install twine

#echo "Prepare for publication 1"
#git clean -fxd

echo "::set-output name=time::$time"
echo "--Entrypoint end"

