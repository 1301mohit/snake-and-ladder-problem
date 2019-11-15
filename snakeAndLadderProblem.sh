#!/bin/bash -x

echo Welcome to Snake and Ladder Simulator

position=0
option=0
checkDie=$((RANDOM % 6 + 1))
noPlay=0
ladder=1
snake=2
die1=1
die2=2
die3=3
die4=4
die5=5
die6=6

function snakeAndLadder() {
	option=$((RANDOM % 3))
	case $option in
		$noPlay)
			position=$position
			;;
		$ladder)
			position=$(($position+$checkDie))
			;;
		$snake)
			position=$(($position-$checkDie))
			if [ $position -lt 0 ]
			then
				position=0
			fi
			;;
	esac
}


case $checkDie in
	$die1)
		echo $die1
		;;
	$die2)
		echo $die2
		;;
	$die3)
		echo $die3
		;;
	$die4)
		echo $die4
		;;
	$die5)
		echo $die5
		;;
	*)
		echo $die6
		;;
esac

snakeAndLadder
