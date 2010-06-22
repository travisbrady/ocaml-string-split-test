OCaml String Split Benchmark
---------------------------

This is a very simple test of 3 functions for spliting a string into a list of strings based on the space character.
Results are the same as `"blah blah".split()` in Python or `words "blah blah"` in Haskell or the equivalent in a zillion other languages.

Results:
-------

(* Using the Stdlib `Str.split (Str.regexp " ") s` method *)
$ time ./test.native std
./test.native std  1.85s user 0.01s system 99% cpu 1.874 total

(* A single loop through the input string *)
$ time ./test.native splitrec
./test.native splitrec  0.72s user 0.00s system 99% cpu 0.733 total

(* Finds indexes of spaces first and then splits on those *)
$ time ./test.native ind_split
./test.native ind_split  0.74s user 0.00s system 98% cpu 0.750 total

