open View

let start_game_page = 
  Render.to_string (Page.page_layout Board.board_body)

let next_game_page _request =
  Render.to_string (Page.page_layout Board.board_body)

