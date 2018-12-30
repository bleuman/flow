#!/bin/bash
red=$'\e[1;31m'
grn=$'\e[1;32m'
yel=$'\e[1;33m' 
blu=$'\e[1;34m'
mag=$'\e[1;35m' 
cyn=$'\e[1;36m' 
end=$'\e[0m'


echo -e "${yel}>flow.log with params $1 "

case $1 in
 a)git log —-all —-oneline —-graph;;
 o)git log --graph --oneline;;
 b)git log --graph --oneline --first-parent master..;;
 *) git log;;
esac;;