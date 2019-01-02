#!/bin/bash
red=$'\e[1;31m'
grn=$'\e[1;32m'
yel=$'\e[1;33m' 
blu=$'\e[1;34m'
mag=$'\e[1;35m' 
cyn=$'\e[1;36m' 
end=$'\e[0m'

print(){
echo -e "${yel}>flow :${end} ${mag}$1${end}"
}
print "runing with param $1 $2 $3 $4 $5 $6 $7 $8"
if [ "$1" == "" ]
then
	echo "
	flow usage:
	r) flow-rebase.sh 2 3
	f) git fetch
	pl) git pull
	ps) git push
	m) git mergetool --tool=vimdiff
	g) git tag -ln 2
	a) git add --all
	b) git branch 2 3 4
	s) git status 2 3 4
	l) flow-log.sh 2
	c) git add --all & commit 2 on actual branch
	k) flow-checkout.sh  2  3  4
	st)	flow-start.sh  2  3  4  5 
	fi)	flow-finish.sh  2  3  4  5 
	fp)	flow-finishp.sh  2  3  4  5
	p)	print 
	"
	exit
fi
case $1 in
	r) flow-rebase.sh $2 $3;;
	f) git fetch $2;;
	pl) git pull --all;;
	ps) git push --tags;;
	psa) git push --all origin;;
	m) git mergetool --tool=vimdiff;;
	g) git tag -ln $2;;
	a) git add --all;;
	b) git branch $2 $3 $4;;
	s) git status $2 $3 $4;;
	l) flow-log.sh $2;;
	c) git add --all && git commit -m "commit $2 on `git branch | grep \* | cut -d ' ' -f2`";;
	k) flow-checkout.sh $2 $3 $4;;
	st)flow-start.sh $2 $3 $4 $5 ;;
	fi)flow-finish.sh $2 $3 $4 $5 ;;
	fp)flow-finishp.sh $2 $3 $4 $5 ;;
	-*)oo="$(echo -e $2 | sed 's/./& /g')" && flow.sh $oo;;
	*) git $1 $2 $3 $4 $5 $6 $7 $8 $9;;
esac
