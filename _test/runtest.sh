#!/bin/sh
#
# Changelog:
#  - 2020-10-14 initial version
#  - 2020-10-15 added -rpcport and all options that follow it to bitcoind
#  - see git log for more

export LC_ALL=C
export LANG=C

TFILE=$HOME/blk00000.dat
BLKSUM=$(sha256sum $TFILE | cut -b-64)
OUTT=/tmp/test-dirsum
test "$BLKSUM" = "dbe46f694caf4dc9cc48261830613808afcb56e59a59625d27eebae390ceba6d" || {
  rm $TFILE
  wget -O $TFILE http://217.195.164.4:13744/_test/blk00000.dat
}

DIR=$HOME/test
test -d $DIR || mkdir $DIR

dirsum() {
  find . -type f | sort | while read f; do md5sum "$f"; done
  find . -type d | sort | md5sum
}

dotest() {
  > /tmp/log
  OUT="$OUTT${1:-1}"
  rm -rf .[a-z]* *.pid *.log *.dat *.json blocks/index blocks/rev* chainstate
  nohup bitcoind -noconnect -nodebuglogfile \
    -datadir=$PWD -reindex \
    -logtimestamps=0 \
    -rpcport=0 -listen=0 -disablewallet \
    -persistmempool=0 \
    -checklevel=0 -checkblocks=1 \
    >/tmp/log 2>&1 &
  PID=$!
  printf "%s: " $OUT
  while ! grep "height=119" /tmp/log
  do sleep 0.1
  done
  kill $PID
  wait $PID
  rm -rf .cookie .lock *.pid *.log *.dat *.json
  dirsum > $OUT
  # following uses chainstate from https://github.com/mycroft/chainstate.git
  # tested with bitcoind 0.21.0
  type chainstate && {
    ln -s chainstate state
    chainstate | sha256sum >> $OUT
  }
}

cd $DIR
bitcoind -version
test -d blocks || mkdir blocks
cp $TFILE blocks/blk00000.dat
dotest
dotest 2
diff -u ${OUTT}*
