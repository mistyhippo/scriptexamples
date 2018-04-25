#!/bin/bash

#This script performs maintenance on ubuntu machine

echo "running apt-get update & apt-get upgrade"
sudo apt-get update -y
sudo apt-get update -y

echo "flushing local cache"
sudo apt-get autoclean

echo "removing unused dependencies and old packages that have newer versions installed"
sudo apt-get autoremove -y

echo "end of script"