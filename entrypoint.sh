#!/bin/sh -l

echo "This is the string provided: $1"
time=$(date)
echo "::set-output name=time::$time"

