all: test.byte test.native test_batteries.native test_batteries.byte

test.native: test.ml
	ocamlopt Str.cmxa -o test.native test.ml

test.byte: test.ml
	ocamlc Str.cma -o test.byte test.ml

test_batteries.native: test_batteries.ml
	ocamlfind ocamlopt -package batteries -thread -linkpkg -o test_batteries.native test_batteries.ml

test_batteries.byte: test_batteries.ml
	ocamlfind ocamlc -package batteries -thread -linkpkg -o test_batteries.byte test_batteries.ml

clean:
	rm -f *.cmx *.cmo *.cmi *.o test.byte test.native
