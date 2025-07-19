#!/bin/bash

set -xe

rsync -a .github/actions-temp/.github/actions/ .github/actions/

# Dummy commit
git config user.email "ci@example.com"
git config user.name "ci"
git add .github
git commit -m "Temporary commit for CI"
