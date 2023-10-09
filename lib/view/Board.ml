let hidden_input name = 
  let open Tyxml.Html in
    input ~a:
      [ a_hidden () 
      ; a_id name
      ; a_name name
      ] ()

let letter_input name =
  let open Tyxml.Html in
    div ~a:
    [ a_id name
    ; a_class ["letter-input"] 
    ] 
    [ txt "" ]

let word_input name =
  let open Tyxml.Html in
  div ~a:[ a_class [ "word-input" ] ] 
  [ letter_input (name ^ "-1")
  ; letter_input (name ^ "-2")
  ; letter_input (name ^ "-3")
  ; letter_input (name ^ "-4")
  ; letter_input (name ^ "-5")
  ]

let board_input = 
  let open Tyxml.Html in
  div ~a:[ a_class [ "board-input" ] ]
  [ hidden_input "guess1"
  ; word_input "guess1"
  ; hidden_input "guess2"
  ; word_input "guess2"
  ; hidden_input "guess3"
  ; word_input "guess3"
  ; hidden_input "guess4"
  ; word_input "guess4"
  ; hidden_input "guess5"
  ; word_input "guess5"
  ; hidden_input "guess6"
  ; word_input "guess6"
  ]

let start_board _game_state = 
  let open Tyxml.Html in
  div ~a:[ a_class [ "board-container" ] ]
  [ board_input ]


let board_body game_state = 
  let open Tyxml.Html in
  form ~a:
    [ a_id "game-form"
    ; a_action "/game/guess"
    ; a_method `Post
    ]
    [ div ~a:
      [ a_class [ "game-body" ] ]
      [ start_board game_state
      ; Keyboard.keyboard game_state
      ]
  ]