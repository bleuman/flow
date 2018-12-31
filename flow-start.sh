#!/bin/bash
red=$'\e[1;31m'
grn=$'\e[1;32m'
yel=$'\e[1;33m' 
blu=$'\e[1;34m'
mag=$'\e[1;35m' 
cyn=$'\e[1;36m' 
end=$'\e[0m'


echo -e "${yel}>flow.start with params $1 ${end}"
if [ "$1" == "" ]
then
	echo "
	Usage : 
	du | ap | ar)  
	t)
	p)    
	"
	exit
fi

git checkout master
git pull
case $1 in 
 du | ap | ar)
   git checkout -b $1/$2 master
   git push --set-upstream origin $1/$2;;
 t)
   echo -e "${yel}>flow update form origin :tig${end}"
   xx=`git branch | grep \* | cut -d ' ' -f2`
   git checkout tig
   git fetch
   git pull
   git checkout $xx
   git checkout -b rctig/$2 tig
   git push --set-upstream origin rctig/$2;;
 p) 
    git checkout -b rcprd/$2 master
    git push --set-upstream origin rcprd/$2;;
esac
