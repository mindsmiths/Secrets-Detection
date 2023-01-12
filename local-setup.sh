#!/bin/bash

## Install gitleaks

# cd /tmp
# git clone https://github.com/zricethezav/gitleaks.git
# cd gitleaks
# make build
# cp gitleaks /usr/bin

git config --global init.templatedir '~/.git-templates'

mkdir -p ~/.git-templates/hooks

cp pre-commit ~/.git-templates/hooks

cp gitleaks.toml ~/.mindsmiths-git-leaks
