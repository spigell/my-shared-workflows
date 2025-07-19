#!/bin/bash

set -xe

COPY="setup-go-env"

rsync -a .github/actions-temp/.github/actions/${COPY} .github/actions/
git update-index --assume-unchanged .github/actions/${COPY}/action.yaml
