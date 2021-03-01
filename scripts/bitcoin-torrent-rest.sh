#!/bin/sh

#test "$#" = "0" && exit 1
BLD=${1:-"$PWD"}
test -d $BLD || exit 1
echo $BLD
sleep 2
OUT=$HOME/bitcoin-torrent-out

test -d $OUT || mkdir $OUT
FN=$OUT/bitcoin-torrent-linearized-020-rest.torrent
test -r $FN && exit 1
echo "Writing $FN..."
webtorrent create -o $FN -a http://a.bublina.eu.org:8000/announce -a udp://a.bublina.eu.org:8000 -a ws://a.bublina.eu.org:8000 --verbose $BLD
