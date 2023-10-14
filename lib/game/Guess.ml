open State.Game

let solution = "ghost"  (* TODO: Load this from db *)

let increment_current_guess game_state =
  { current_guess = game_state.current_guess + 1
  ; guess1 = game_state.guess1
  ; guess2 = game_state.guess2
  ; guess3 = game_state.guess3
  ; guess4 = game_state.guess4
  ; guess5 = game_state.guess5
  ; guess6 = game_state.guess6 }

let execute game_state = (* TODO: LMAO change guesses to a list probably *)
  match (game_state.current_guess) with
  | 1 -> if (String.length game_state.guess1) = 5 then (increment_current_guess game_state) else game_state
  | 2 -> if (String.length game_state.guess2) = 5 then (increment_current_guess game_state) else game_state
  | 3 -> if (String.length game_state.guess3) = 5 then (increment_current_guess game_state) else game_state
  | 4 -> if (String.length game_state.guess4) = 5 then (increment_current_guess game_state) else game_state
  | 5 -> if (String.length game_state.guess5) = 5 then (increment_current_guess game_state) else game_state
  | _ -> game_state

