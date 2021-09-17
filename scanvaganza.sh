#!/bin/bash
#This code will scan a whole network, knocking on specific ports and then saving on file 'target' the target ip.

if ["$1" == ""]
then
        echo "type the network like 10.10.10"
else
for ip in {1..254};
do
hping3 -S -p 13 -c 1 $1.$ip;hping3 -S -p 37 -c 1 $1.$ip;hping3 -S -p 30000 -c 1 $1.$ip;hping3 -S -p 3000 -c 1 $1.$ip;hping3 -S -p 1337 -c 1 $1.$ip 2> /dev/null | grep "flags=SA" | cut -d " " -f 2 | cut -d "=" -f2 >> target.txt;

done
fi
