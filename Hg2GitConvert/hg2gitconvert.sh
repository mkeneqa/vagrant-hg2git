#!/bin/bash

REPO="G3HeadCal"
HOME_PATH="/home/vagrant"

mkdir -p ${HOME_PATH}/Hg2GitConvert/GIT/${REPO}

cd ${HOME_PATH}/Hg2GitConvert/MERC/${REPO}
hg update

cd ${HOME_PATH}/Hg2GitConvert/GIT/${REPO}
git init

sh ${HOME_PATH}/fast-export/hg-fast-export.sh -r ${HOME_PATH}/Hg2GitConvert/MERC/${REPO} --force
git checkout

echo "Conversion Completed and saved in:${HOME_PATH}/Hg2GitConvert/GIT/${REPO}"