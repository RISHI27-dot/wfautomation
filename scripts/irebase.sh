#!/bin/bash

n=$1

m=$(($n - 1))

git rebase -i HEAD~$m^
