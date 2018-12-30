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
		ap) git checkout ap/$3 ;;
		t | p)
         if [ "$1pb"!= "" ] 
		   then
		tb=`git branch |grep -v \* | grep rctig/`
		   if [ "$tb" != "" ] 
		   then
			git checkout $tb 
		   fi;;
	   	p)
		pb=`git branch |grep -v \* | grep rcprd/`
		   if [ "$pb" != "" ] 
		   then
			git checkout $pb
		   fi;;
		tig) git checkout tig;;
		prd) git checkout master;;
esac