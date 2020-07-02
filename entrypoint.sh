#!/bin/sh -l

echo "--Entrypoint begin"
pwd

REF=$GITHUB_REF
echo "This is the string from GITHUB_REF env var: ${REF}"

echo $(which python)
echo $(python --version)
PYTHON=$(which python3)
$PYTHON /validate_version.py ${REF}

time=$(date)

echo "Install package"
pip install .

echo "Install publication deps"
pip install twine

#echo "Prepare for publication 1"
#git clean -fxd

echo "::set-output name=time::$time"
echo "--Entrypoint end"

