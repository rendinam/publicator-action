#!/usr/bin/env python3
# Perform a simple check on the tag portion of the git reference
# passed in as the first argument.:bn

import sys
import semver

print('\n')
gitref = sys.argv[1]
print(f'Validation script argument: {gitref}')
tag = gitref.split('/')[-1]
print(f'Tag: {tag}')
version = semver.VersionInfo.parse(tag)
print('Tag is a valid semver value.')
