let keyboard_key letter =
  let open Tyxml.Html in
  button ~a:[ a_class [ "keyboard-key" ] ] [ txt letter ]

let keyboard_row keys =
  let open Tyxml.Html in
  div ~a:[ a_class [ "keyboard-row" ] ] keys 

let keyboard = 
  let open Tyxml.Html in 
  div ~a:[ a_class [ "keyboard" ] ]
  [ keyboard_row 
    [ keyboard_key "Q"
    ; keyboard_key "W"
    ; keyboard_key "E"
    ; keyboard_key "R"
    ; keyboard_key "T"
    ; keyboard_key "Y"
    ; keyboard_key "U"
    ; keyboard_key "I"
    ; keyboard_key "O"
    ; keyboard_key "P"
    ]
  ; keyboard_row
    [ keyboard_key "A"
    ; keyboard_key "S"
    ; keyboard_key "D"
    ; keyboard_key "F"
    ; keyboard_key "G"
    ; keyboard_key "H"
    ; keyboard_key "J"
    ; keyboard_key "K"
    ; keyboard_key "L"
    ]
  ; keyboard_row
    [ keyboard_key "ENTER"
    ; keyboard_key "Z"
    ; keyboard_key "X"
    ; keyboard_key "C"
    ; keyboard_key "V"
    ; keyboard_key "B"
    ; keyboard_key "N"
    ; keyboard_key "M"
    ; keyboard_key "DELETE"
    ]
  ]