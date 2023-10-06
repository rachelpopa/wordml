open Tyxml

let page_title = Html.( title ( txt "WORDML" ))

let board = Html.(div [
  txt "This is the start game board"
])

let start_game_board_page =
  Render.to_string (Html.(html 
    ( head page_title [] )
    ( body [ board ] )))
  