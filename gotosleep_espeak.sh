#!/bin/bash

export DISPLAY=:0.0

level=${1:-normal}

# echo "home is $HOME"
# touch $HOME/.dbus/Xdbus
# chmod 600 $HOME/.dbus/Xdbus
# env | grep DBUS_SESSION_BUS_ADDRESS > $HOME/.dbus/Xdbus
# echo 'export DBUS_SESSION_BUS_ADDRESS' >> $HOME/.dbus/Xdbus

# . $HOME/.dbus/Xdbus

url="http://www.stands4.com/services/v2/quotes.php?uid=${USERID}&tokenid=${TOKENID}&searchtype=SEARCH&query=sleeping"
IP=$(/usr/bin/curl --silent $url)

summary="Sleeping time is precious"
body="It's soon time to switch off the screen."
quotes=$(/bin/echo "$IP" | /bin/grep -oPm1 "(?<=<quote>)[^<]+")

quote=$(echo "$quotes" | sort -R | head -n1)

echo $quote

/usr/bin/notify-send "$summary" "$body\n\n$quote" -u $level -a "gotosleep"

/bin/echo "$summary $body\n\n$quote" | /usr/bin/espeak -v female3

exit 0