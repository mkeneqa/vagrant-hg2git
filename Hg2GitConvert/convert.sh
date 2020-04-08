#!/bin/bash

HOME_PATH="/home/vagrant"
MERC_REPO_PATH=${HOME_PATH}/Hg2GitConvert/MERC
GIT_REPO_PATH=${HOME_PATH}/Hg2GitConvert/GIT
DONE_DIR=${HOME_PATH}/Hg2GitConvert/MERC_DONE
FAST_EXPORT_DIR=${HOME_PATH}/fast-export

cd ${MERC_REPO_PATH}

for dir in `ls -1 .`; do 

    echo $dir
    cd ${MERC_REPO_PATH}/$dir
    hg update

    mkdir ${GIT_REPO_PATH}/$dir
    cd ${GIT_REPO_PATH}/$dir
    git init

    sh ${FAST_EXPORT_DIR}/hg-fast-export.sh -r ${MERC_REPO_PATH}/$dir --force
    git checkout    
    
    echo 'pausing . . .'
    sleep 2
done

echo 'HG2Git Coversion Completed!'
exit 0