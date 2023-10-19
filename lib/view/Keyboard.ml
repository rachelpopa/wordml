open State.Game

let keyboard_key ?(size_class = "small") ?(colour_class = "light-grey") key_label =
  let open Tyxml.Html in
  button ~a:[ a_class [ "keyboard-key"; size_class; colour_class ] 
            ; a_button_type `Button
            ; a_onclick (Control.Game.game_input key_label)
            ] 
  [ txt key_label ]

let colour_key key guesses =
  keyboard_key (Char.escaped key) ~colour_class:(Game.Colour.css_of_colour (Game.Colour.get_key_colour key guesses))

let keyboard_row keys =
  let open Tyxml.Html in
  div ~a:[ a_class [ "keyboard-row" ] ] keys 

let keyboard game_state = 
  let open Tyxml.Html in 
  div ~a:[ a_class [ "keyboard" ] ]
  [ keyboard_row 
    [ colour_key 'Q' game_state.guesses
    ; colour_key 'W' game_state.guesses
    ; colour_key 'E' game_state.guesses
    ; colour_key 'R' game_state.guesses
    ; colour_key 'T' game_state.guesses
    ; colour_key 'Y' game_state.guesses
    ; colour_key 'U' game_state.guesses
    ; colour_key 'I' game_state.guesses
    ; colour_key 'O' game_state.guesses
    ; colour_key 'P' game_state.guesses
    ]
  ; keyboard_row
    [ colour_key 'A' game_state.guesses
    ; colour_key 'S' game_state.guesses
    ; colour_key 'D' game_state.guesses
    ; colour_key 'F' game_state.guesses
    ; colour_key 'G' game_state.guesses
    ; colour_key 'H' game_state.guesses
    ; colour_key 'J' game_state.guesses
    ; colour_key 'K' game_state.guesses
    ; colour_key 'L' game_state.guesses
    ]
  ; keyboard_row
    [ keyboard_key "ENTER" ~size_class:"large"
    ; colour_key 'Z' game_state.guesses
    ; colour_key 'X' game_state.guesses
    ; colour_key 'C' game_state.guesses
    ; colour_key 'V' game_state.guesses
    ; colour_key 'B' game_state.guesses
    ; colour_key 'N' game_state.guesses
    ; colour_key 'M' game_state.guesses
    ; keyboard_key "DELETE" ~size_class:"large"
    ]
  ]