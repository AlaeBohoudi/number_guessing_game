#!/bin/bash
#Alae Bohoudi

PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"
echo -e "\n~~~ Number Guessing Game ~~~\n"
#generate random number between 1-1000
RANDOM_NUMBER=$((1 + $RANDOM % 1000))
# ask for username
echo -e "Enter your username:"
while [[ -z $INPUT_USERNAME ]];
do 
 read INPUT_USERNAME
done
#search database for username
RESULT_USERNAME=$($PSQL "SELECT * FROM usergames WHERE username='$INPUT_USERNAME'")
#if not found
if [[ -z $RESULT_USERNAME ]]
then 
  echo -e "Welcome, $INPUT_USERNAME! It looks like this is your first time here."
  GAMES_PLAYED=0
  BEST_GAME=0
  INSERT_NEW=$($PSQL "INSERT INTO usergames(username, games_played, best_game) VALUES('$INPUT_USERNAME', $GAMES_PLAYED, $BEST_GAME)")
else
#if found 
  echo "$RESULT_USERNAME" | while read USERNAME BAR GAMES_PLAYED BAR BEST_GAME
  do
  echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
fi

echo -e "\nGuess the secret number between 1 and 1000:"

#play the game
NUMBER_GUESS=0
while [[ $USER_INPUT != $RANDOM_NUMBER ]];
do
  read USER_INPUT
  #if input not integer
  if [[ ! $USER_INPUT =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  #if input is integer
  else
    let "NUMBER_GUESS+=1"
    #if input greater than random
    if [[ $USER_INPUT -gt $RANDOM_NUMBER ]]
    then
      echo "It's lower than that, guess again:"
   #if input lower than random
    elif [[ $USER_INPUT -lt $RANDOM_NUMBER ]]
    then
      echo "It's higher than that, guess again:"
    # if input equals random
    else
      echo -e "\nYou guessed it in $NUMBER_GUESS tries. The secret number was $RANDOM_NUMBER. Nice job!"
    fi
  fi
done
#add new stats
RESULT_USERNAME=$($PSQL "SELECT * FROM usergames WHERE username='$INPUT_USERNAME'")
 echo "$RESULT_USERNAME" | while read USERNAME BAR GAMES_PLAYED BAR BEST_GAME
 do
    let "GAMES_PLAYED+=1"
    BEST_GAME=$(( BEST_GAME < NUMBER_GUESS && BEST_GAME > 0 ? BEST_GAME : NUMBER_GUESS ))
    RESULT_UPDATE=$($PSQL "UPDATE usergames SET games_played = $GAMES_PLAYED, best_game = $BEST_GAME WHERE username= '$USERNAME' ")
done
