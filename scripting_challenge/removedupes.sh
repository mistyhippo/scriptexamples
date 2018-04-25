#!/bin/bash

echo "Changing directories to where we want to get rid of duplicates"
cd /home/zoning/Documents/codingnomads/scriptexamples/scripting_challenge/scripting_challenge

echo "listing the duplicates within this folder"
fdupes -r .

echo "delete files one by one or in a range"
fdupes -d .