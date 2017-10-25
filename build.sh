#!/bin/bash

echo 'Pull host ssh keys'
mkdir ~/.ssh
touch ~/.ssh/known_hosts
ssh-keyscan $GIT_HOST >> ~/.ssh/known_hosts
ssh-keyscan $SCP_HOST >> ~/.ssh/known_hosts

echo 'Add private key from environment var'
echo "$KEY" > ~/.ssh/id_rsa
chmod 400 ~/.ssh/id_rsa

echo 'Clone Jekyll project repo'
mkdir ~/jekyll
git clone $GIT_REPO ~/jekyll

echo 'jekyll build'
cd ~/jekyll
#gem install bundler
bundle install
jekyll build -s ~/jekyll -d ~/jekyll/_site

echo 'scp'
scp -r -o "BatchMode yes" ~/jekyll/_site/* $SCP_DEST

echo 'done'
