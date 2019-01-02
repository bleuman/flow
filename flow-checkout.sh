#!/bin/bash
red=$'\e[1;31m'
grn=$'\e[1;32m'
yel=$'\e[1;33m' 
blu=$'\e[1;34m'
mag=$'\e[1;35m' 
cyn=$'\e[1;36m' 
end=$'\e[0m'

source flow-utils.sh

echo -e "${yel}>flow.checkout with params $1 $2 $3${end}"
if [ "$1" == "" ]
then
	echo "
	Usage : 
	du | ap | ar )git checkout 1/2
	t | p) git branch  rctig| rcprd
	tig) git checkout tig
	prd) git checkout master
	r) git checkout -b 2 origin/2
	"
	exit
fi

if [ "`isWorkTreeClean`" != "0" ]
then 
	echo "Travail non commité, veuillez commiter les modifications en cours avant de poursuivre"
	exit
fi
case $1 in 
du | ap | ar )git fetch && git checkout $1/$2;;
t | p)
 if [ "$1" == "t" ] 
  then
   br=`git branch |grep -v \* | grep t/`
  else
   br=`git branch |grep -v \* | grep p/`
 fi
  if [ "$br" != "" ] 
  then
   git fetch && git checkout $br
  fi;;
tig) git fetch && git checkout tig;;
prd)git fetch && git checkout master;;
r)git fetch && git checkout -b $2 origin/$2;;
*) git checkout $1;;
esac
