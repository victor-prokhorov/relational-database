#!/bin/bash

PSQL='psql -X --username=freecodecamp --dbname=salon --tuples-only -c'
SALON_SERVICE() {
    if [[ $1 ]]; then
        echo -e "\n$1"
    fi
    LIST_SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
    echo "$LIST_SERVICES" | while read SERVICE_ID BAR SERVICE; do
        echo "$SERVICE_ID) $SERVICE"
    done
    read SERVICE_ID_SELECTED
    SERVICE_EXISTS=$($PSQL "SELECT EXISTS(SELECT 1 FROM services WHERE service_id = $SERVICE_ID_SELECTED)" | sed 's/ //g')
    if [[ $SERVICE_EXISTS == "t" ]]; then
        echo -e "\nWhat's your phone number?"
        read CUSTOMER_PHONE
        CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'" | sed 's/ //g')
        if [[ -z $CUSTOMER_NAME ]]; then
            echo -e "\nI don't have a record for that phone number, what's your name?"
            read CUSTOMER_NAME
            $PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')"
        fi
        SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED" | sed 's/ //g')
        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
        echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
        read SERVICE_TIME
        INSERT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
        if [[ $INSERT_RESULT == "INSERT 0 1" ]]; then
            echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
        fi
    else
        SALON_SERVICE "I could not find that service. What would you like today?"
    fi
}

echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo -e "Welcome to My Salon, how can I help you?\n"
SALON_SERVICE
