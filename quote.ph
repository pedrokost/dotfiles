#!/bin/bash

url="http://www.stands4.com/services/v2/quotes.php?uid=${USERID}&tokenid=${TOKENID}&searchtype=SEARCH&query=sleeping"
IP=$(/usr/bin/curl --silent $url)

quote=$(/bin/echo "$IP" | /bin/grep -oPm1 "(?<=<quote>)[^<]+")


echo "$quote" | sort -R | head -n 1

