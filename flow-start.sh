#!/bin/bash
red=$'\e[1;31m'
grn=$'\e[1;32m'
yel=$'\e[1;33m' 
blu=$'\e[1;34m'
mag=$'\e[1;35m' 
cyn=$'\e[1;36m' 
end=$'\e[0m'


echo -e "${yel}>flow.start with params $1 ${end}"
}

update_frm_orig(){
  echo -e "${yel}>flow update form origin :$1${end}"
  xx=`git branch | grep \* | cut -d ' ' -f2`
  git checkout $1
  git fetch
  git pull
  git checkout $xx
}


git checkout master
git pull
case $1 in 
 du | ap | ar)
   git checkout -b $1/$3 master
   git push --set-upstream origin $1$2;;
 t)
   update_frm_orig "tig"
   git checkout -b rctig/$3 tig
   git push --set-upstream origin rctig/$3;;
 p) 
    git checkout -b rcprd/$3 master
    git push --set-upstream origin rcprd/$3;;
esac