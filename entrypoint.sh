#!/bin/sh -l

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

/usr/bin/python3 --version
/usr/bin/gcc --version

$PYTHON --version
$PYTHON /validate_version.py ${REF}

time=$(date)

echo "Install package"
$PIP install .

echo "Install publication deps"
$PIP install twine

echo "Prepare for publication"
git clean -fxd
python setup.py build sdist --format=gztar

echo "::set-output name=time::$time"
echo "--Entrypoint end"

