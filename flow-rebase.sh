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
 s) case $2 in
   f) git rebase du/$3;;
   h) git rebase ap/$3;;
   b) git rebase ar/$3;;
  esac;;
 c) git rebase --continue;;
 f) git rebase --skip;;
 a) git rebase --abort;;
esac