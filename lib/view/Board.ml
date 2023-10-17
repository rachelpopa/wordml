open State.Game

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
    | h::t -> (letter_input (name ^ "-" ^ (string_of_int n)) (Char.escaped h) (Game.Colour.get_colour h (n-1))) :: aux (n+1) t
  in aux 1 (Util.String.explode_string value)

let hidden_input name value = 
  let open Tyxml.Html in
    input ~a:
      [ a_hidden () 
      ; a_id name
      ; a_name name
      ; a_value value
      ] ()

let word_input name value =
  let open Tyxml.Html in
  div ~a:[ a_class [ "word-input" ] ] 
  (letter_inputs name value)

let word_components game_state =
  let rec aux i guesses =
    match guesses with 
    | [] -> []
    | h::t -> (hidden_input ("guess" ^ string_of_int i) h)
              ::(word_input ("guess" ^ string_of_int i) h)
              ::aux (i + 1) t
  in aux 1 game_state.guesses

let board_input game_state = 
  let open Tyxml.Html in
  div ~a:[ a_class [ "board-input" ] ]
  (word_components game_state)

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