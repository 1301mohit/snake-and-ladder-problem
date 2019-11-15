#!/bin/bash -x

echo Welcome to Snake and Ladder Simulator


STARTING_POSITION=0
WINNING_POSITION=10
NO_PLAY=0
LADDER=1
SNAKE=2
PLAYER1=0
PLAYER2=1

lastPosition=0
position=0
position1=0
position2=0
option=0
countWin1=0
countWin2=0
player=0

function play()
{
	checkDie=$((RANDOM % 6 + 1))
	option=$((RANDOM % 3))
	case $option in
	$NO_PLAY)
		position=$1
		echo $position
		;;
	$LADDER)
		lastPosition=$1
		position=$(($1+$checkDie))
		if [ $position -gt $WINNING_POSITION ]
		then
			position=$lastPosition
		fi
		echo $position
		;;
	$SNAKE)
		position=$(($1-$checkDie))
		if [ $position -lt $STARTING_POSITION ]
		then
			position=0
		fi
		echo $position
		;;
	esac
}

while [ $position1 -lt $WINNING_POSITION ] || [ $position2 -lt $WINNING_POSITION ]
do
	if [ $player -eq $PLAYER1 ]
	then
		((countWin1++))
		position1="$( play $position1 )"
		player=$PLAYER2
	else
		((countWin2++))
		position2="$( play $position2 )"
		player=$PLAYER1
	fi
done

if [ $player -eq $PLAYER1 ]
then
	echo "Winning count:"$countWin1
else
	echo "Winning Count:"$countWin2
fi

echo "Winning player: Player"$player


