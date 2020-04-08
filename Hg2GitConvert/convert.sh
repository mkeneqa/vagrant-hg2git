#!/bin/bash

REPO_NAME="<<##REPO_NAME_GOES_HERE##>>"
HOME_PATH="/home/vagrant"
MERC_REPO_PATH=${HOME_PATH}/Hg2GitConvert/MERC/${REPO_NAME}
GIT_REPO_PATH=${HOME_PATH}/Hg2GitConvert/GIT/${REPO_NAME}
DONE_DIR=${HOME_PATH}/Hg2GitConvert/MERC_DONE

mkdir -p ${GIT_REPO_PATH}

cd ${MERC_REPO_PATH}
hg update

cd ${GIT_REPO_PATH}
git init

sh ${HOME_PATH}/fast-export/hg-fast-export.sh -r ${MERC_REPO_PATH} --force
git checkout

mv ${MERC_REPO_PATH} ${DONE_DIR}

echo "Conversion Completed and saved in:${GIT_REPO_PATH}"