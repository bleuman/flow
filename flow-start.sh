#!/bin/bash
red=$'\e[1;31m'
grn=$'\e[1;32m'
yel=$'\e[1;33m' 
blu=$'\e[1;34m'
mag=$'\e[1;35m' 
cyn=$'\e[1;36m' 
end=$'\e[0m'

arg1="$1"
arg2="$2"

echo -e "${yel}>flow.start with params $1 ${end}"

if [ "$arg1" == ""  ]
then
	read -p "Start ticket: du/ap/ar/p/t : " arg1
fi

if [ "$arg2" == ""  ]
then
	read -p "Start $arg1/" arg2
fi
case $arg1 in 
 du | ap | ar | p | t )
   if [ "`git tag -l "s-$arg1/$arg2"`" == "s-$arg1/$arg2" ]
   then
	echo "$arg1/$arg2 deja cree"
	exit
   fi

   base="master"
   if [ "$arg1" == "t" ]
   then
	base="tig"
   else
	base="master"
   fi

   git checkout "$base"
   git pull
   git checkout -b $arg1/$arg2 "$base"
   git tag -a "s-$arg1/$arg2" -m "Starting $arg1/$arg2 from $base"
   git push --set-upstream origin $arg1/$arg2;;
esac
