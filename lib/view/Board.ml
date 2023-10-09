let hidden_input name = 
  let open Tyxml.Html in
    input ~a:
      [ a_hidden () 
      ; a_id name
      ; a_name name
      ] ()

let letter_input =
  let open Tyxml.Html in
    div ~a:[ a_class ["letter-input"] ] 
    [ txt "L" ]

let word_input =
  let open Tyxml.Html in
  div ~a:[ a_class [ "word-input" ] ] 
  [ letter_input
  ; letter_input
  ; letter_input
  ; letter_input
  ; letter_input
  ]

let board_input = 
  let open Tyxml.Html in
  div ~a:[ a_class [ "board-input" ] ]
  [ hidden_input "guess1"
  ; word_input
  ; hidden_input "guess2"
  ; word_input
  ; hidden_input "guess3"
  ; word_input
  ; hidden_input "guess4"
  ; word_input
  ; hidden_input "guess5"
  ; word_input
  ; hidden_input "guess6"
  ; word_input
  ]

let start_board = 
  let open Tyxml.Html in
  div ~a:[ a_class [ "board-container" ] ]
  [ board_input ]


let board_body = 
  let open Tyxml.Html in
  form ~a:
    [ a_id "game-form"
    ; a_action "/game/guess"
    ; a_method `Post
    ]
    [ div ~a:
      [ a_class [ "game-body" ] ]
      [ start_board 
      ; Keyboard.keyboard
      ]
  ]