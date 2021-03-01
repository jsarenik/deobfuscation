# Hello World!

Today I found prunednode.today and decided to quickly
sum up what I did in order to possibly help.

The general idea is that linearized full-node blocks
(from genesis) are perfectly verifiable. The `rev` files
also. Just the chainstate uses obfuscation and is XORed with
random bytes on each node. Though the random bytes are static
and set once in the beginning, they render the whole chainstate
to look different.

See `_test` directory for a very simple and 100% reproducible
test. Of course you will get different random bytes :-) but
everyone can see the only difference is in the chainstate,
which is obfuscated according to bitcoin/bitcoin@42cb38816
commited in 2015.
