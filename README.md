OCaml String Split Benchmark
---------------------------

This is a very simple test of 3 functions for spliting a string into a list of strings based on the space character.
Results are the same as `"blah blah".split()` in Python or `words "blah blah"` in Haskell or the equivalent in a zillion other languages.

Results:
-------

####Using the Stdlib `Str.split (Str.regexp " ") s` method

`
$ time ./test.native std
./test.native std  1.85s user 0.01s system 99% cpu 1.874 total
`

`
$ time ./test.byte std
./test.byte std  11.28s user 0.03s system 98% cpu 11.459 total
`

####A single loop through the input string

`
$ time ./test.native splitrec
./test.native splitrec  0.72s user 0.00s system 99% cpu 0.733 total
`

`
$ time ./test.byte splitrec
./test.byte splitrec  4.99s user 0.01s system 99% cpu 5.037 total
`

####Finds indexes of spaces first and then splits on those

`
$ time ./test.native ind_split
./test.native ind_split  0.74s user 0.00s system 98% cpu 0.750 total
`

`
$ time ./test.byte ind_split
./test.byte ind_split  7.16s user 0.02s system 99% cpu 7.223 total
`

####Same thing using BatString.nsplit from Batteries

`
$ time ./test_batteries                                                                     
./test_batteries  1.03s user 0.01s system 99% cpu 1.048 total
`

`
$ time ./test_batteries.byte
./test_batteries.byte  8.61s user 0.04s system 95% cpu 9.048 total
`

####Using split_char from [Tokenize a string](http://rosettacode.org/wiki/Tokenize_a_string#OCaml)
`
$ time ./test.native split_char                
./test.native split_char  0.57s user 0.00s system 86% cpu 0.667 total
`

`
$ time ./test.byte split_char
./test.byte split_char  4.93s user 0.02s system 97% cpu 5.057 total
`
Conclusion
----------
split_char is fastest with splitrec a close second.  Choices abound but everything is better than `Str.split (Str.regexp " ") s` if you just need to split on a single character.
