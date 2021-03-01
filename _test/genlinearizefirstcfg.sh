#!/bin/sh
#
# In order to get the same blk00000.dat file on any full node
# do following:
#    cd src/bitcoin/contrib/linearize
#    wget http://217.195.164.4:13744/_test/genlinearizefirstcfg.sh
#    sh genlinearizefirstcfg.sh > linearize-first.cfg
#    ./linearize-hashes.py linearize-first.cfg > hashlist-first.txt
#    ./linearize-data.py linearize-first.cfg

DATADIR=$HOME/.bitcoin
INPUT=$DATADIR/blocks
OUTPUT=$HOME/linearize_first
test -d $OUTPUT || mkdir $OUTPUT

cat <<EOF
datadir=$DATADIR
#max_height=119964
max_height=119
max_out_sz=134217728
netmagic=f9beb4d9
genesis=000000000019d6689c085ae165831e934ff763ae46a2a6c172b3f1b60a8ce26f
input=$INPUT
output=$OUTPUT
hashlist=hashlist-first.txt
out_of_order_cache_sz = 100000000
rev_hash_bytes = False
file_timestamp = 1
EOF
