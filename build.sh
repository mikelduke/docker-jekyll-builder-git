#!/bin/bash

#Pull host ssh keys
mkdir ~/.ssh
touch ~/.ssh/known_hosts
ssh-keyscan $GIT_HOST >> ~/.ssh/known_hosts
ssh-keyscan $SCP_HOST >> ~/.ssh/known_hosts

#Add private key from environment var
echo "$KEY" > ~/.ssh/id_rsa
chmod 400 ~/.ssh/id_rsa

#Clone Jekyll project repo
git clone $GIT_REPO .

jekyll build

#Copy to site
scp -r _site/* $SCP_DEST

echo 'done'
