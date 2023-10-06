let main () =
  let open Dream in
  run
  @@ logger
  @@ set_secret (to_base64url (random 32))
  @@ cookie_sessions
  @@ router
    [ get "/" ( fun _req -> html ~status:`OK "Hellow World")]

let () = main ()