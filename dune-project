(lang dune 3.10)

(name wordml)

(generate_opam_files true)

(source
 (github rachelpopa/wordml))

(authors "Rachel Popa")

(maintainers "Rachel Popa")

(package
 (name wordml)
 (synopsis "An OCaml Wordle clone")
 (description "This is just for learning some OCaml frameworks and libraries")
 (depends 
  ocaml 
  dune
  dream
  lwt
  tyxml
 )
)

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
