#!/bin/bash

# Create git template directory
mkdir -p ~/.git-templates/hooks

# Set template directory for git
git config --global init.templatedir '~/.git-templates'

# Add pre-commit template
cp pre-commit ~/.git-templates/hooks

# Add custom gitleaks config with secret regexes locally.
cp gitleaks.toml ~/.mindsmiths-gitleaks
