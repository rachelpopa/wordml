open Wordml

let main () =
  let open Dream in
  run
  @@ logger
  @@ set_secret (to_base64url (random 32))
  @@ cookie_sessions
  @@ router
    [ get "/" ( fun _req -> html ~status:`OK "Hello World")
    ; get "/game" ( fun _req -> html ~status:`OK Handler.start_game_page)
    ; post "/game/guess" ( fun request -> Handler.next_game_page request)
    ; get "/static/**" @@ Dream.static "static"
    ]

let () = main ()
