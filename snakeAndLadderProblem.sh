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
countWin=0

while [ $position -lt $winningPosition ]
do
	checkDie=$((RANDOM % 6 + 1))
	option=$((RANDOM % 3))
	case $option in
	$noPlay)
		position=$position
		;;
	$ladder)
		case $position in
		95)
			if [ $checkDie -lt 5 ]
			then
				position=$(($position+$checkDie))
			fi
			;;
		96)
			if [ $checkDie -lt 4 ]
			then
				position=$(($position+$checkDie))
			fi
			;;
		97)
			if [ $checkDie -lt 3 ]
			then
				position=$(($position+$checkDie))
			fi
			;;
		98)
			if [ $checkDie -lt 2 ]
			then
				position=$(($position+$checkDie))
			fi
			;;
		99)
			if [ $checkDie -lt 1 ]
			then
				position=$(($position+$checkDie))
			fi
			;;
		*)
			position=$(($position+$checkDie))
			;;
		esac
		((countWin++))
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
echo "Winning count:"$countWin


