
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
  [ word_input
  ; word_input
  ; word_input
  ; word_input
  ; word_input
  ; word_input
  ]

let start_board = 
  let open Tyxml.Html in
  div ~a:[ a_class [ "board-container" ] ]
  [ board_input ]


let game_body = 
  let open Tyxml.Html in
  div ~a:[ a_class [ "game-body" ] ]
  [ start_board 
  ; Keyboard.keyboard
  ]
