open State.Game

let solution = "GHOST"  (* TODO: Load this from db *)

let increment_current_guess game_state =
  { game_state with current_guess = game_state.current_guess + 1 }

let execute game_state =
  let rec aux i guesses =
    match guesses with 
    | [] -> game_state
    | h::t -> if (i = game_state.current_guess) && (String.length h) = 5 then (increment_current_guess game_state)
              else aux (i + 1) t
  in aux 1 game_state.guesses
