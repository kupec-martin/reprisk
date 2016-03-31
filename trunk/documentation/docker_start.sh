#!/bin/bash

echo --------	Starting status		--------
sudo docker ps -a
echo ---------------------------------------
echo
echo --------	Started containers	--------
sudo docker start genesis
sudo docker start redis
sudo docker start anubis
sudo docker exec -d anubis node start
sudo docker start rstudio
sudo docker start shiny
sudo docker start skydns
echo ---------------------------------------
echo
echo --------	Ending status		--------
sudo docker ps -a
echo ---------------------------------------
