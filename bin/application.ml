open Wordml

let main () =
  let open Dream in
  run
  @@ logger
  @@ set_secret (to_base64url (random 32))
  @@ cookie_sessions
  @@ router
    [ get "/" ( fun _req -> html ~status:`OK "Hello World")
    ; get "/start" ( fun _req -> html ~status:`OK Handler.start_board_page)
    ]

let () = main ()
