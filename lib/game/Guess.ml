open State.Game

let solution = "ghost"  (* TODO: Load this from db *)

(* MUTATION *)
let increment_current_guess game_state =
  let() = game_state.current_guess <- game_state.current_guess + 1 in
  game_state

let execute game_state = (* TODO: LMAO change guesses to a list probably *)
  match (game_state.current_guess) with
  | 1 -> if (String.length game_state.guess1) = 5 then (increment_current_guess game_state) else game_state
  | 2 -> if (String.length game_state.guess2) = 5 then (increment_current_guess game_state) else game_state
  | 3 -> if (String.length game_state.guess3) = 5 then (increment_current_guess game_state) else game_state
  | 4 -> if (String.length game_state.guess4) = 5 then (increment_current_guess game_state) else game_state
  | 5 -> if (String.length game_state.guess5) = 5 then (increment_current_guess game_state) else game_state
  | _ -> game_state

