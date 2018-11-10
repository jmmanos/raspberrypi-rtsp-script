#!/bin/bash

echo "Setting up live555"
wget http://www.live555.com/liveMedia/public/live555-latest.tar.gz
tar xvzf live555-latest.tar.gz
cd live
./genMakefiles linux
make -j2
echo "Finished setting up live555"

echo "Setting up RaspberryPiRTSPServer."
# get file
pwd
mkdir raspi
mv ../raspi/* ./raspi
cd raspi/
make

echo "Starting server."
raspivid --mode 3 -w 1920 -h 1080 -fps 30 -b 10000000 -pf high --drc med -t 0 -o - | ./testRaspi
