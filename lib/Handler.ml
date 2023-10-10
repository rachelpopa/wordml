open View
open Board

let start_game_page = 
  Render.to_string (Page.page_layout (Board.board_body ()))

let next_game_page request =
  let%lwt mbody = Dream.body request in
  let () = print_endline(mbody) in
  match%lwt Dream.form request with
  | `Ok [ "guess1", g1
        ; "guess2", g2
        ; "guess3", g3
        ; "guess4", g4
        ; "guess5", g5
        ; "guess6", g6
        ; "current_guess", c
        ] -> 
          Dream.html ~status:`OK (
            Render.to_string (Page.page_layout (Board.board_body ~game_state:(
              { current_guess = c
              ; guess1 = g1
              ; guess2 = g2
              ; guess3 = g3
              ; guess4 = g4
              ; guess5 = g5
              ; guess6 = g6
              }) ())))
  | _ -> Dream.html ~status:`Bad_Request "Bad form data"
  