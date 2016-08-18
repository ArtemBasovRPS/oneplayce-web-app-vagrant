#!/bin/sh

printf $'\e[32mOnePlayce vagrant deployment is \e[1mSTARTED\e[0m ['
printf "$(date)"
printf $']'
echo
vagrant plugin install vagrant-hostmanager
git init
git remote add origin git@github.com:SergeyKuzmich/oneplayce-web-app-vagrant.git
git fetch
git checkout -t origin/master
git clone git@github.com:iggym4/OnePlayce-RPS-Backend.git sites/oneplayce
cd sites/oneplayce
git fetch
git checkout develop
cd ../..
vagrant up
rm deploy.sh
printf $'\e[32mOnePlayce vagrant deployment is \e[1mFINISHED\e[0m ['
printf "$(date)"
printf $']'
echo
printf $'\e[32mYou can access to the website by \e[4;94mhttp://oneplayce.le\e[24;32m URL\e[0m'
echo 
