
let letter_input =
  let open Tyxml.Html in
    div [ txt "L" ]
  
  
let word_input =
  let open Tyxml.Html in
  div [ letter_input
  ; letter_input
  ; letter_input
  ; letter_input
  ; letter_input
  ]

let start_board_body = 
  let open Tyxml.Html in
  div 
  [ txt "This is the start game board"
  ; word_input
  ; word_input
  ; word_input
  ; word_input
  ; word_input
  ; word_input
  ]