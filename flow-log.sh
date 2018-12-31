#!/bin/bash
red=$'\e[1;31m'
grn=$'\e[1;32m'
yel=$'\e[1;33m' 
blu=$'\e[1;34m'
mag=$'\e[1;35m' 
cyn=$'\e[1;36m' 
end=$'\e[0m'


echo -e "${yel}>flow.log with params $1 ${end}"
if [ "$1" == "" ]
then
	echo "
	Usage : 
	a)git log --all --oneline --graph;;
	o)git log --graph --oneline;;
	b)git log --graph --oneline --first-parent master..;;
	g)git log --graph --oneline;;
	*)git log --oneline;;
	"
	exit
fi
case $1 in
 a)git log --all --oneline --graph;;
 o)git log --graph --oneline;;
 b)git log --graph --oneline --first-parent master..;;
 g)git log --graph --oneline;;
 *)git log --oneline;;
esac
