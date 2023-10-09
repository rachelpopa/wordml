open View

let start_game_page = 
  Render.to_string (Page.page_layout (Board.board_body Json.empty_json))

let next_game_page request =
  let%lwt body = Dream.body request in
  let json = Json.from_string body in
  match json with
  | Ok(game_state) -> Dream.html ~status:`OK (Render.to_string (Page.page_layout (Board.board_body game_state)))
  | Error _e -> Dream.html ~status:`Bad_Request "Improperly formed json"
  
