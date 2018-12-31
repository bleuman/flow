#!/bin/bash
red=$'\e[1;31m'
grn=$'\e[1;32m'
yel=$'\e[1;33m' 
blu=$'\e[1;34m'
mag=$'\e[1;35m' 
cyn=$'\e[1;36m' 
end=$'\e[0m'


echo -e "${yel}>flow.finish with params $1 ${end}"

echo -e "${yel}>flow.start with params $1 ${end}"
if [ "$1" == "" ]
then
	echo "
	Usage : 
	du)
	du-r)
	du-f)
	t)
	p)    
	"
	exit
fi

git checkout master
git pull
case $1 in 
	du)
		echo -e "${yel}>flow update form origin :du/$2 ${end}"
		xx=`git branch | grep \* | cut -d ' ' -f2`
		git checkout "du/$2"
		git fetch
		git pull
		git checkout $xx
		git merge du/$2 -m "merge :du/$2";;
	du-r)git rebase du/$2;;
	du-f)git merge du/$2;;
		ap)git merge ap/$2 ;;
	t)
		git checkout tig
		git merge rctig/$2
		git tag -a "vt$2" -m "tag msg: $3"
		git branch -d rctig/$2
	;;
	p)
		git checkout master
		git merge rcprd/$2
		git tag -a "vp$2" -m "tag msg: $3"
		git branch -d rcprd/$2
	;;
esac
	