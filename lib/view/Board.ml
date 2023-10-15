open State.Game

let hidden_input name value = 
  let open Tyxml.Html in
    input ~a:
      [ a_hidden () 
      ; a_id name
      ; a_name name
      ; a_value value
      ] ()

let letter_input name value colour =
  let open Tyxml.Html in
    div ~a:
    [ a_id name
    ; a_class ["letter-input"
              ; colour
              ]
    ] 
    [ txt value ]

let letter_inputs name value =
  let rec aux n value = 
    match value with
    | [] -> if n > 5 then [] else (letter_input (name ^ "-" ^ (string_of_int n)) "" "black") :: aux (n+1) value
    | h::t -> (letter_input (name ^ "-" ^ (string_of_int n)) (Char.escaped h) (Game.Guess.get_colour h n)) :: aux (n+1) t
  in aux 1 (Util.String.explode_string value)

let word_input name value =
  let open Tyxml.Html in
  div ~a:[ a_class [ "word-input" ] ] 
  (letter_inputs name value)

let board_input game_state = 
  let open Tyxml.Html in
  div ~a:[ a_class [ "board-input" ] ]
  [ hidden_input "guess1" game_state.guess1
  ; word_input "guess1" game_state.guess1
  ; hidden_input "guess2" game_state.guess2
  ; word_input "guess2" game_state.guess2
  ; hidden_input "guess3" game_state.guess3
  ; word_input "guess3" game_state.guess3
  ; hidden_input "guess4" game_state.guess4
  ; word_input "guess4" game_state.guess4
  ; hidden_input "guess5" game_state.guess5
  ; word_input "guess5" game_state.guess5
  ; hidden_input "guess6" game_state.guess6
  ; word_input "guess6" game_state.guess6
  ]

let start_board game_state = 
  let open Tyxml.Html in
  div ~a:[ a_class [ "board-container" ] ]
  [ board_input game_state 
  ; hidden_input "current_guess" (string_of_int game_state.current_guess)
  ]

let board_body ?(game_state = State.Game.start_game_state) csrf_tag = 
  let open Tyxml.Html in
  form ~a:
    [ a_id "game-form"
    ; a_action "/game/guess"
    ; a_method `Post
    ]
    [ csrf_tag
    ; div ~a:
      [ a_class [ "game-body" ] ]
      [ start_board game_state
      ; Keyboard.keyboard game_state
      ]
    ]