#!/bin/bash
red=$'\e[1;31m'
grn=$'\e[1;32m'
yel=$'\e[1;33m' 
blu=$'\e[1;34m'
mag=$'\e[1;35m' 
cyn=$'\e[1;36m' 
end=$'\e[0m'


echo -e "${yel}>flow.rebase with params $1 $2 $3${end}"
if [ "$1" != "0" ]
then
	echo "Travail non commité, veuillez commiter les modifications en cours avant de poursuivre"
	exit
fi
then
	echo "
	Usage : 
	s) git rebase 2/3;;
	c) git rebase --continue;;
	f) git rebase --skip;;
	a) git rebase --abort;;
	"
	exit
fi
case $1 in
 s) git rebase $2/$3;;
 c) git rebase --continue;;
 f) git rebase --skip;;
 a) git rebase --abort;;
esac

