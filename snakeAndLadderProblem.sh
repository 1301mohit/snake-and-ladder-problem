#!/bin/bash -x

echo Welcome to Snake and Ladder Simulator

position=0
option=0
startingPosition=0
winningPosition=100
noPlay=0
ladder=1
snake=2
die1=1
die2=2
die3=3
die4=4
die5=5
die6=6

while [ $position -lt $winningPosition ]
do
	checkDie=$((RANDOM % 6 + 1))
	option=$((RANDOM % 3))
	case $option in
	$noPlay)
		position=$position
		;;
	$ladder)
		position=$(($position+$checkDie))
		if [ $position -gt $winningPosition ]
		then
			position=100
		fi
		;;
	$snake)
		position=$(($position-$checkDie))
		if [ $position -lt $startingPosition ]
		then
			position=0
		fi
		;;
	esac
done


