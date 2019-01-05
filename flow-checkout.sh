#!/bin/bash
red=$'\e[1;31m'
grn=$'\e[1;32m'
yel=$'\e[1;33m' 
blu=$'\e[1;34m'
mag=$'\e[1;35m' 
cyn=$'\e[1;36m' 
end=$'\e[0m'

source flow-utils.sh
arg="$1"
arg2="$2"
arg3="$3"

echo -e "${yel}>flow.checkout with params $1 $2 $3${end}"
if [ "$arg" == "" ]
then
	echo "
	Usage : 
	du | ap | ar )git checkout 1/2
	t | p) git branch  rctig| rcprd
	tig) git checkout tig
	prd) git checkout master
	r) git checkout -b 2 origin/2
	"
	read -p "enter arg : " arg
	echo "****** $arg"
	#exit
fi

if [ "`isWorkTreeClean`" != "0" ]
then 
	echo "Travail non commité, veuillez commiter les modifications en cours avant de poursuivre"
	exit
fi
case $arg in 
du | ap | ar )
	if [ "$arg2" == "" ] 
	then
	  read -p "enter arg2 : $arg/" arg2
	fi
	git fetch && git checkout $arg/$arg2;;
t | p)
 if [ "$arg" == "t" ] 
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
r)git fetch && git checkout -b $arg2 origin/$arg2;;
*) git checkout $arg;;
esac
