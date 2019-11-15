#!/bin/bash -x

echo Welcome to Snake and Ladder Simulator


STARTING_POSITION=0
WINNING_POSITION=100
NO_PLAY=0
LADDER=1
SNAKE=2
PLAYER1=0
PLAYER2=1

lastPosition=0
position=0
option=0
countWin=0
player=0

while [ $position -lt $WINNING_POSITION ]
do
	checkDie=$((RANDOM % 6 + 1))
	option=$((RANDOM % 3))
	((countWin++))
	case $option in
	$NO_PLAY)
		position=$position
		;;
	$LADDER)
		lastPosition=$position
		position=$(($position+$checkDie))
		if [ $position -gt $WINNING_POSITION ]
		then
			position=$lastPosition
		fi
		;;
	$SNAKE)
		position=$(($position-$checkDie))
		if [ $position -lt $STARTING_POSITION ]
		then
			position=0
		fi
		;;
	esac
	if [ $player -eq $PLAYER1 ]
	then
		player=$PLAYER2
	else
		player=$PLAYER1
	fi
done
echo "Winning count:"$countWin
echo "Winning player:"$player


