let keyboard_key_small letter =
  let open Tyxml.Html in
  button ~a:[ a_class [ "keyboard-key small" ] ] [ txt letter ]

let keyboard_key_large letter =
  let open Tyxml.Html in
  button ~a:[ a_class [ "keyboard-key large" ] ] [ txt letter ]

let keyboard_row keys =
  let open Tyxml.Html in
  div ~a:[ a_class [ "keyboard-row" ] ] keys 

let keyboard = 
  let open Tyxml.Html in 
  div ~a:[ a_class [ "keyboard" ] ]
  [ keyboard_row 
    [ keyboard_key_small "Q"
    ; keyboard_key_small "W"
    ; keyboard_key_small "E"
    ; keyboard_key_small "R"
    ; keyboard_key_small "T"
    ; keyboard_key_small "Y"
    ; keyboard_key_small "U"
    ; keyboard_key_small "I"
    ; keyboard_key_small "O"
    ; keyboard_key_small "P"
    ]
  ; keyboard_row
    [ keyboard_key_small "A"
    ; keyboard_key_small "S"
    ; keyboard_key_small "D"
    ; keyboard_key_small "F"
    ; keyboard_key_small "G"
    ; keyboard_key_small "H"
    ; keyboard_key_small "J"
    ; keyboard_key_small "K"
    ; keyboard_key_small "L"
    ]
  ; keyboard_row
    [ keyboard_key_large "ENTER"
    ; keyboard_key_small "Z"
    ; keyboard_key_small "X"
    ; keyboard_key_small "C"
    ; keyboard_key_small "V"
    ; keyboard_key_small "B"
    ; keyboard_key_small "N"
    ; keyboard_key_small "M"
    ; keyboard_key_large "DELETE"
    ]
  ]