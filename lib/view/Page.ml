
let page_layout body_ =
  let open Tyxml.Html in
  html
    ~a:[ a_lang "en" ]
    ( head 
      ( title ( txt "WORDML" ))
      [ meta ~a:[ a_charset "utf-8" ] () 
      ; link ~rel:[ `Stylesheet ] ~href:"/static/css/style.css" ()
      ]
    )
    ( body
      body_
    )