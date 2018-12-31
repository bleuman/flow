#!/bin/bash
red=$'\e[1;31m'
grn=$'\e[1;32m'
yel=$'\e[1;33m' 
blu=$'\e[1;34m'
mag=$'\e[1;35m' 
cyn=$'\e[1;36m' 
end=$'\e[0m'


echo -e "${yel}>flow.finishp with params $1 ${end}"


case $1 in 
		du) 
			xx=`git branch | grep \* | cut -d ' ' -f2`
			git checkout master
			git merge du/$2
			git checkout tig
			git merge du/$2
			git branch -d du/$2
			git push origin --delete du/$2
			git checkout $xx
		;;
		ap) 
			git checkout master
			git merge ap/$2
			git tag -a "ap-$2" -m "tag msg: $3"
			git checkout tig
			git merge ap/$2
			git branch -d ap/$2
		;;	
esac
	
