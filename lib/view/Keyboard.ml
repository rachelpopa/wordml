open State.Game

let keyboard_key ?(size_class = "small") ?(colour_class = "light-grey") key_label =
  let open Tyxml.Html in
  button ~a:[ a_class [ "keyboard-key"; size_class; colour_class ] 
            ; a_button_type `Button
            ; a_onclick (Control.Game.game_input key_label)
            ] 
  [ txt key_label ]

let keyboard_row keys =
  let open Tyxml.Html in
  div ~a:[ a_class [ "keyboard-row" ] ] keys 

let keyboard game_state = 
  let open Tyxml.Html in 
  div ~a:[ a_class [ "keyboard" ] ]
  [ keyboard_row 
    [ keyboard_key "Q" ~colour_class:(Game.Colour.get_key_colour 'Q' game_state.guesses)
    ; keyboard_key "W" ~colour_class:(Game.Colour.get_key_colour 'W' game_state.guesses)
    ; keyboard_key "E" ~colour_class:(Game.Colour.get_key_colour 'E' game_state.guesses)
    ; keyboard_key "R" ~colour_class:(Game.Colour.get_key_colour 'R' game_state.guesses)
    ; keyboard_key "T" ~colour_class:(Game.Colour.get_key_colour 'T' game_state.guesses)
    ; keyboard_key "Y" ~colour_class:(Game.Colour.get_key_colour 'Y' game_state.guesses)
    ; keyboard_key "U" ~colour_class:(Game.Colour.get_key_colour 'U' game_state.guesses)
    ; keyboard_key "I" ~colour_class:(Game.Colour.get_key_colour 'I' game_state.guesses)
    ; keyboard_key "O" ~colour_class:(Game.Colour.get_key_colour 'O' game_state.guesses)
    ; keyboard_key "P" ~colour_class:(Game.Colour.get_key_colour 'P' game_state.guesses)
    ]
  ; keyboard_row
    [ keyboard_key "A" ~colour_class:(Game.Colour.get_key_colour 'A' game_state.guesses)
    ; keyboard_key "S" ~colour_class:(Game.Colour.get_key_colour 'S' game_state.guesses)
    ; keyboard_key "D" ~colour_class:(Game.Colour.get_key_colour 'D' game_state.guesses)
    ; keyboard_key "F" ~colour_class:(Game.Colour.get_key_colour 'F' game_state.guesses)
    ; keyboard_key "G" ~colour_class:(Game.Colour.get_key_colour 'G' game_state.guesses)
    ; keyboard_key "H" ~colour_class:(Game.Colour.get_key_colour 'H' game_state.guesses)
    ; keyboard_key "J" ~colour_class:(Game.Colour.get_key_colour 'J' game_state.guesses)
    ; keyboard_key "K" ~colour_class:(Game.Colour.get_key_colour 'K' game_state.guesses)
    ; keyboard_key "L" ~colour_class:(Game.Colour.get_key_colour 'L' game_state.guesses)
    ]
  ; keyboard_row
    [ keyboard_key "ENTER" ~size_class:"large"
    ; keyboard_key "Z" ~colour_class:(Game.Colour.get_key_colour 'Z' game_state.guesses)
    ; keyboard_key "X" ~colour_class:(Game.Colour.get_key_colour 'X' game_state.guesses)
    ; keyboard_key "C" ~colour_class:(Game.Colour.get_key_colour 'C' game_state.guesses)
    ; keyboard_key "V" ~colour_class:(Game.Colour.get_key_colour 'V' game_state.guesses)
    ; keyboard_key "B" ~colour_class:(Game.Colour.get_key_colour 'B' game_state.guesses)
    ; keyboard_key "N" ~colour_class:(Game.Colour.get_key_colour 'N' game_state.guesses)
    ; keyboard_key "M" ~colour_class:(Game.Colour.get_key_colour 'M' game_state.guesses)
    ; keyboard_key "DELETE" ~size_class:"large"
    ]
  ]