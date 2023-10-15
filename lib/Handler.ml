open View
open State.Game
open Game

let start_game_page request = 
  Dream.html ~status:`OK (Render.to_string (Page.page_layout (Board.board_body ( Csrf.render request ))))

let next_game_page request =
  let%lwt mbody = Dream.body request in
  let () = print_endline(mbody) in
  match%lwt Dream.form ~csrf:true request with
  | `Ok [ "current_guess", c
        ; "guess1", g1
        ; "guess2", g2
        ; "guess3", g3
        ; "guess4", g4
        ; "guess5", g5
        ; "guess6", g6
        ] -> 
          begin
            match int_of_string_opt c with
            | Some(curr_guess) -> 
                      let game_state = 
                        { current_guess = curr_guess
                        ; guesses = [ g1
                                    ; g2
                                    ; g3
                                    ; g4
                                    ; g5
                                    ; g6
                                    ]
                        } in
                        Dream.html ~status:`OK (
                          Render.to_string (
                              Page.page_layout (Board.board_body ~game_state:(Guess.execute game_state) ( Csrf.render request ))
                            )
                        )
            | None -> Dream.html ~status:`Bad_Request "Current guess is not valid"
           end
  | _ -> Dream.html ~status:`Bad_Request "Bad form data"
