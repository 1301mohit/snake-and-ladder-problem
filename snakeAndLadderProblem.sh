#!/bin/bash -x

echo Welcome to Snake and Ladder Simulator

#Constants
STARTING_POSITION=0
WINNING_POSITION=10
NO_PLAY=0
LADDER=1
SNAKE=2
PLAYER1=0
PLAYER2=1

#Global variables
lastPosition=0
position=0
diceCountForPlayer1=0
diceCountForPlayer2=0
player=0

function position()
{
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

function play()
{
	checkDie=$((RANDOM % 6 + 1))
	position="$( position $1 )"
	echo $position
}

function win()
{
	position1=0
	position2=0
	while [ $position1 -lt $WINNING_POSITION ] && [ $position2 -lt $WINNING_POSITION ]
	do
		if [ $player -eq $PLAYER1 ]
		then
			((diceCountForPlayer1++))
			position1="$( play $position1 )"
			if [ $position1 -lt $WINNING_POSITION ]
			then
				player=$PLAYER2
			fi
			echo $player
		else
			((diceCountForPlayer2++))
			position2="$( play $position2 )"
			if [ $position2 -lt $WINNING_POSITION ]
			then
				player=$PLAYER1
			fi
			echo $player
		fi
	done
}

function main()
{
	win
	if [ $player -eq $PLAYER1 ]
	then
		echo "Total dice count for player1:"$diceCountForPlayer1
	else
		echo "Total dice count for player2:"$diceCountForPlayer2
	fi

	echo "Winning player: Player"$(($player+1))
	
}

main



