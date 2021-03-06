#!/usr/bin/env bash

if ! git config remote.upstream.url > /dev/null; then
    git remote add upstream https://github.com/shopware/production.git
fi
git fetch
git fetch upstream
git fetch upstream --tags

git show-ref --verify --quiet refs/heads/$(cat ./.bztrs/.branch)
if [[ $? == 0 ]]; then
    git checkout $(cat ./.bztrs/.branch) --quiet
else
    git checkout --track origin/$(cat ./.bztrs/.branch)
fi

git fetch --tags upstream
git merge "upstream/$(cat ./.bztrs/.branch)"
