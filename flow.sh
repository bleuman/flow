#!/bin/bash
red=$'\e[1;31m'
grn=$'\e[1;32m'
yel=$'\e[1;33m' 
blu=$'\e[1;34m'
mag=$'\e[1;35m' 
cyn=$'\e[1;36m' 
end=$'\e[0m'

is_clean(){
return `git status | grep nothing | wc -l`
}
update_frm_orig(){
  echo -e "${yel}>flow update form origin :$1${end}"
  xx=`git branch | grep \* | cut -d ' ' -f2`
  git checkout $1
  git fetch
  git pull
  git checkout $xx
}
print(){
echo -e "${yel}>flow :${end} ${mag}$1${end}"
}
print "runing with param $1 $2 $3 $4 $5 $6 $7 $8"
case $1 in
	r) flow-rebase.sh $2 $3;;
	f) git fetch;;
	pl) git pull;;
	ps) git push;;
	m) git mergetool --tool=vimdiff;;
	g) git tag -ln $2;;
	a) print "git add --all"
	   git add --all;;
	b) print "git branch $2 $3 $4"
	   git branch $2 $3 $4;;
	s) print "git status"
	   git status ;;
	l) flow-log.sh $2;;
	c) git add --all
	   git commit -m "commit $2 on `git branch | grep \* | cut -d ' ' -f2`";;
	k) flow-checkout.sh $2 $3 $4;;
	st)	print "start" 
    git checkout master
    git fetch
    git pull
	case $2 in 
		du) git checkout -b du/$3 master
	 	 git push --set-upstream origin du/$3;;
		ar) git checkout -b ar/$3 master
		 git push --set-upstream origin ar/$3;;
		ap) git checkout -b ap/$3 master
	   	 git push --set-upstream origin ap/$3;;
		t)  update_frm_orig "tig"
                 git checkout -b rctig/$3 tig
                git push --set-upstream origin rctig/$3;;
        	p) git checkout -b rcprd/$3 master
		   git push --set-upstream origin rcprd/$3;;
	esac;;	
	fi)	print "finish" 
	case $2 in 
		du)
        update_frm_orig "du/$3"
         git merge du/$3 -m "merge :du/$3";;
		du-r)git rebase du/$3;;
		du-f)git merge du/$3;;
		ap)git merge ap/$3 ;;
		t)
			git checkout tig
			git merge rctig/$3
			git tag -a "vt$3" -m "tag msg: $4"
			git branch -d rctig/$3
		;;
		p)
			git checkout master
			git merge rcprd/$3
			git tag -a "vp$3" -m "tag msg: $4"
			git branch -d rcprd/$3
		;;
	esac;;
	fp)	echo "finishp" 
	case $2 in 
		du) 
			xx=`git branch | grep \* | cut -d ' ' -f2`
			git checkout master
			git merge du/$3
			git checkout tig
			git merge du/$3
			git branch -d du/$3
			git checkout $xx
		;;
		ap) 
			git checkout master
			git merge ap/$3
			git tag -a "ap-$3" -m "tag msg: $4"
			git checkout tig
			git merge ap/$3
			git branch -d ap/$3		
		;;	
	esac;;
p)	print "$2 $3 $4 $5 $6 $7 $8 $9" ;;
esac
