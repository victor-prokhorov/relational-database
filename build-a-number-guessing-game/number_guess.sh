#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
echo Enter your username:
read USERNAME
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
if [[ -z $USER_ID ]]
then
	echo "Welcome, $USERNAME! It looks like this is your first time here."
	$PSQL "INSERT INTO users(username) VALUES('$USERNAME')" > /dev/null
	USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
else
	GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id = $USER_ID")
	BEST_GAME=$($PSQL "SELECT MAX(guesses) FROM games WHERE user_id = $USER_ID")
	echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi
echo Guess the secret number between 1 and 1000:
SECRET=$((1 + $RANDOM % 1000))
LAST_GUESS=0
GUESSES=0
while [[ $LAST_GUESS != $SECRET ]]
do
	read LAST_GUESS
	if [[ ! $LAST_GUESS =~ ^[0-9]+$ ]]
	then
		echo -e "\nThat is not an integer, guess again:"
	elif [[ $LAST_GUESS -lt $SECRET ]]
	then
		echo -e "\nIt's lower than that, guess again:"
	elif [[ $LAST_GUESS -gt $SECRET ]]
	then
		echo -e "\nIt's higher than that, guess again:"
	fi
	((GUESSES++))
done
echo "You guessed it in $GUESSES tries. The secret number was $SECRET. Nice job!"
$PSQL "INSERT INTO games(guesses, user_id) VALUES($GUESSES, $USER_ID)" > /dev/null
