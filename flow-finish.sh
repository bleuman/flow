#!/bin/bash
red=$'\e[1;31m'
grn=$'\e[1;32m'
yel=$'\e[1;33m' 
blu=$'\e[1;34m'
mag=$'\e[1;35m' 
cyn=$'\e[1;36m' 
end=$'\e[0m'


echo -e "${yel}>flow.finish with params $1 ${end}"

if [ "$1" == "" ]
then
	echo "
	Usage : 
	du) finish du/x
	du-r) rebase du/x
	du-m) merge du/x
	t) finish rctig/$2
	p) finish rcprd/$2
	"
	exit
fi

xx=`git branch | grep \* | cut -d ' ' -f2`
git checkout master
git pull
git checkout $xx
case $1 in 
	du)

		xx=`git branch | grep \* | cut -d ' ' -f2`
		git checkout "du/$2"
		git fetch
		git pull
		git checkout $xx
		git merge du/$2 -m "merge :du/$2";;
	du-r)
		git rebase du/$2;;
	du-m)
		git merge du/$2;;
	ap)
		git merge ap/$2 ;;
	t)
		git checkout tig
		git merge t/$2
		git tag -a "vt$2" -m "tag msg: $3"
		git push --all origin
		git branch -d t/$2
		git push origin --delete t/$2;;
	p)
		git checkout master
		git merge p/$2
		git tag -a "vp$2" -m "tag msg: $3"
		git push --tags
		git branch -d p/$2
		git push origin --delete p/$2;;
	del)
		git branch -d $2
		git push origin --delete $2;;
esac
	
