#!/bin/bash
echo "Stopping Old Services"
TORPID=sudo lsof -t -i:9050
if [ -n "$TORPID" ]
then
echo "Stopping Tor"
sudo kill -9 $(TORPID)
else
echo "Tor is not running"
fi
