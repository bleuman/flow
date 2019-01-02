#!/bin/bash
red=$'\e[1;31m'
grn=$'\e[1;32m'
yel=$'\e[1;33m' 
blu=$'\e[1;34m'
mag=$'\e[1;35m' 
cyn=$'\e[1;36m' 
end=$'\e[0m'


getCurrentBranch(){
	echo `git branch | grep \* | cut -d ' ' -f2`
}
isTagExist(){
	echo `git tag -l "$1" | wc -l`
}
isTikcetExist(){
	echo `git tag -l "s-$1" | wc -l`
}

pullAll(){
	git pull --all
}
pushAll(){
	git push --all --tags origin
}
isWorkTreeClean()t{
	echo `git status -s | wc -l`
}
isCurrent(){
	echo `git branch | grep '\*$1/' | wc -l `	
}

