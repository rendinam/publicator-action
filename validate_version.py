#!/usr/bin/env python3

import sys
import os
import semver

print('*****************************')
print('*****************************')
gitref = sys.argv[1]
print(f'Validation script argument: {gitref}')
tag = gitref.split('/')[-1]
print(f'Tag: {tag}')
version = semver.VersionInfo.parse(tag)
print('Tag is a valid semver value.')
print('*****************************')
print('*****************************')
