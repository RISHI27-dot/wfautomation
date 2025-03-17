#!/bin/bash

remote=$1
barnch=$2

git fetch $remote
git pull $remote $branch --rebase

echo "Rebased to $remote/$branch"

