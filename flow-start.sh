#!/bin/bash
red=$'\e[1;31m'
grn=$'\e[1;32m'
yel=$'\e[1;33m' 
blu=$'\e[1;34m'
mag=$'\e[1;35m' 
cyn=$'\e[1;36m' 
end=$'\e[0m'


echo -e "${yel}>flow.start with params $1 ${end}"
if [ "$1" == ""  ] || [ "$2" == ""  ]
then
	echo "
	Usage : 
	du | ap | ar)  
	t)
	p)    
	"
	exit
fi

case $1 in 
 du | ap | ar | p | t )
   if [ "`git tag -l "s-$1/$2"`" == "s-$1/$2" ]
   then
	echo "$1/$2 deja cree"
	exit
   fi

   base="master"
   if [ "$1" == "t" ]
   then
	base="tig"
   else
	base="master"
   fi

   git checkout "$base"
   git pull
   git checkout -b $1/$2 "$base"
   git tag -a "s-$1/$2" -m "Starting $1/$2 from $base"
   git push --set-upstream origin $1/$2;;
esac
