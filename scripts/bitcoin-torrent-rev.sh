#!/bin/sh

#BLD=$HOME/.bitcoin/blocks
BLD=$PWD
OUT=$HOME/bitcoin-torrent-out
WH=$HOME/bitcoin-torrent

procdir() {
  test -n "$1" || return 1
  newdir=${part}
  ls $* >/dev/null 2>&1 \
    && {
      mkdir "$WH/${part}" && ln $* "$WH/${part}"
    }
}

rm -rf $WH
mkdir $WH
cd $BLD
for part in $(seq -w 0 999)
do
  echo $part
  procdir ???$part* || break
done

cd $WH
#ls -t | sed 1q | xargs rm -rf

test -d $OUT || mkdir $OUT
for archive in *
do
  FN=$OUT/bitcoin-torrent-linearized-rev-$archive.torrent
  test -r $FN && continue
  echo "Writing $FN..."
#  mv $archive blocks
  ln -s $archive blocks
#  ctorrent -t -u udp://tracker.leechers-paradise.org:6969/announce -s $FN blocks
#    -u udp://tracker.opentrackr.org:1337/announce \
  #mktorrent -o bitcoin-torrent-$archive.torrent -a udp://tracker.openbittorrent.com:80 -a udp://tracker.leechers-paradise.org:6969 -a udp://tracker.coppersurfer.tk:6969 -a udp://tracker.opentrackr.org:1337 -a udp://explodie.org:6969 -a udp://tracker.empire-js.us:1337 -a wss://tracker.btorrent.xyz blocks
  #mktorrent -o $FN -a http://a.bublina.eu.org:8000/announce -a udp://a.bublina.eu.org:8000 -a ws://a.bublina.eu.org:8000 blocks
  #transmission-create -o $FN -t http://a.bublina.eu.org:8000/announce -t udp://a.bublina.eu.org:8000 -t ws://a.bublina.eu.org:8000 -c "blk$archive* and rev$archive* files" blocks
  webtorrent create -o $FN -a http://a.bublina.eu.org:8000/announce -a udp://a.bublina.eu.org:8000 -a ws://a.bublina.eu.org:8000 --verbose blocks
  rm blocks
##  mv blocks $archive
done

#mkdir $WH/index
#ln $BLD/index/* $WH/index

du -hs $WH/*
