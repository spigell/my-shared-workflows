#!/bin/bash

set -xe

rsync -a .github/actions-temp/.github/actions/ .github/actions/
git update-index --assume-unchanged $(find .github -type f)
