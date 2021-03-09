# Bitcoin Torrent Linearized

## Introduction

The idea is as old [as humans exploring Bitcoin][blk].

[blk]: https://luke.dashjr.org/programs/bitcoin/files/blk0001/

But, the idea was, for a good reason, always put down.
Think about the reason yourself. It really is a good and
sound one.

On the other hand no one can really think about this good
reason until they get hands-on experience with real Bitcoin Core
node. And how better to get that experience than to download
a pruned node quickly and start playing with it.

What more, today there are [methods][bt1] to [verify][bt2] the
[chainstate][bt3]. We will get to that here.

[bt1]: https://github.com/in3rsha/bitcoin-chainstate-parser
[bt2]: https://github.com/mycroft/chainstate
[bt3]: https://github.com/sr-gi/bitcoin_tools

These tools are also doing the needed chainstate deobfuscation.
We will get to that also.

See also [UTXO snapshots PR](https://github.com/bitcoin/bitcoin/pull/15606).

## Prunednode.today

When this repository was first uploaded to github, I just found
the [prunednode.today](https://prunednode.today)
and decided to quickly sum up what I did in in the past
so that it may possibly help similar efforts and above all
it will help understanding the topic.

The general idea is that linearized full-node blocks
(from genesis) are perfectly verifiable. The `rev` files
also. Just the chainstate uses obfuscation and is XORed with
random bytes on each node. Though the random bytes are static
and set once in the beginning, they render the whole chainstate
to look different. This is solved by the chainstate tools mentionted
earlier. These tools do deobfuscation of chainstate and decode its
contents so that it can be confirmed to be the same for many nodes
(even the pruned ones) at a particular block height.

See `_test` directory for a very simple and 100% reproducible
test. Of course you will get different random bytes but
everyone can see the only difference is in the chainstate,
which is obfuscated according to bitcoin/bitcoin@42cb38816
commited in 2015. This `_test` was done before I found there are
chainstate tools that do the deobfuscation and can produce
deterministic results.
