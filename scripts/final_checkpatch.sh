#!/bin/bash

./scripts/checkpatch.pl *.patch

red='\033[31m'
reset='\033[0m'

echo -e "${red}+++++++++++++++++++++++++++++++++++++++++${reset}"

echo "TAKE CARE OF THE FOLLOWING: 

1. No checkpatch warnings and errors
2. Rebased to the latest branch 
3. Added the PENDING / HACK / FROMLIST tag 
4. Added subject to the cover letter 
"
echo -e "${red}+++++++++++++++++++++++++++++++++++++++++${reset}"
