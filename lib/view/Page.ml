let title_header =
  let open Tyxml.Html in
  div ~a:[ a_class [ "title-bar" ] ] 
    [div ~a:[ a_class ["title-text"] ] [  txt "Wordml"  ]]


let page_layout body_ =
  let open Tyxml.Html in
  html
    ~a:[ a_lang "en" ]
    ( head 
      ( title ( txt "Wordml" ))
      [ meta ~a:[ a_charset "utf-8" ] () 
      ; link ~rel:[ `Stylesheet ] ~href:"/static/css/style.css" ()
      ]
    )
    ( body
      ~a:[ a_onkeydown Control.Game.key_pressed ]
      [ title_header
      ; script ~a:[ a_src "/static/js/game.js"] (txt "")
      ; body_
      ]
    )