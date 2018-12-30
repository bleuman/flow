#!/bin/bash
red=$'\e[1;31m'
grn=$'\e[1;32m'
yel=$'\e[1;33m' 
blu=$'\e[1;34m'
mag=$'\e[1;35m' 
cyn=$'\e[1;36m' 
end=$'\e[0m'


echo -e "${yel}>flow.rebase with params $1 $2 $3"

case $1 in 
du | ap | ar )git checkout $1/$2;;
t | p)
 if [ "$1"!= "t" ] 
  then
   br=`git branch |grep -v \* | grep rctig/`
  else
   br=`git branch |grep -v \* | grep rcprd/`
 fi
  if [ "$br" != "" ] 
  then
   git checkout $br
  fi;;
tig) git checkout tig;;
prd) git checkout master;;
esac
