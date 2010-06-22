all: test.byte test.native

test.native: test.ml
	ocamlopt Str.cmxa -o test.native test.ml

test.byte: test.ml
	ocamlc Str.cma -o test.byte test.ml

clean:
	rm -f *.cmx *.cmo *.cmi *.o test.byte test.native
