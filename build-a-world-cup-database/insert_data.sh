#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

while IFS=',' read year round winner opponent winner_goals opponent_goals
do
	if [[ $winner != winner ]]
	then
		$PSQL "INSERT INTO teams(name) VALUES('$winner')"
	fi
	if [[ $opponent != opponent ]]
	then
		$PSQL "INSERT INTO teams(name) VALUES('$opponent')"
	fi
done < games.csv

while IFS=',' read year round winner opponent winner_goals opponent_goals
do
	if [[ $winner != winner ]]
	then
		winner_id=$($PSQL "SELECT team_id FROM teams WHERE name = '$winner'")
	fi
	if [[ $opponent != opponent ]]
	then
		opponent_id=$($PSQL "SELECT team_id FROM teams WHERE name = '$opponent'")
	fi
	if [[ -n $winner_id && -n $opponent_id ]]
	then
		$PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($year, '$round', $winner_id, $opponent_id, $winner_goals, $opponent_goals)"
	fi
done < games.csv

