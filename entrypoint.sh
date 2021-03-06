#!/bin/bash -l

set -e

echo "--Entrypoint begin"
echo "Custom working directory: $(pwd)"
ls -al

REF=$GITHUB_REF
echo "This is the string from GITHUB_REF env var: ${REF}"

PYTHON=$(which python3.6)
echo "PYTHON=${PYTHON}"
PIP=$(which pip3)
echo "PIP=${PIP}"
GCC=$(which gcc)
echo "GCC=${GCC}"
GIT=$(which git)
echo "GIT=${GIT}"

/usr/bin/python3 --version
/usr/bin/gcc --version

$PYTHON --version

time=$(date)

echo "Install package"
$PIP install .

echo "Install publication deps"
$PIP install twine semver

# Validate the version
$PYTHON /validate_version.py ${REF}

echo "Prepare for publication"
$GIT clean -fxd
$PYTHON setup.py build sdist --format=gztar
TWINE=$(which twine)
$TWINE upload --repository-url https://test.pypi.org/legacy/ dist/*

#echo "::set-output name=time::$time"
echo "--Entrypoint end"
