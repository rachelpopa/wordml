open State.Game

let solution = "GHOST"  (* TODO: Load this from db *)

let increment_current_guess game_state =
  { game_state with current_guess = game_state.current_guess + 1 }

let execute game_state = (* TODO: LMAO change guesses to a list probably *)
  match (game_state.current_guess) with
  | 1 -> if (String.length game_state.guess1) = 5 then (increment_current_guess game_state) else game_state
  | 2 -> if (String.length game_state.guess2) = 5 then (increment_current_guess game_state) else game_state
  | 3 -> if (String.length game_state.guess3) = 5 then (increment_current_guess game_state) else game_state
  | 4 -> if (String.length game_state.guess4) = 5 then (increment_current_guess game_state) else game_state
  | 5 -> if (String.length game_state.guess5) = 5 then (increment_current_guess game_state) else game_state
  | _ -> game_state

let get_colour letter_guess position =
  let rec aux index solution_letters colour =
    match solution_letters with
    | [] -> colour
    | h::t -> if h = letter_guess then
              begin
                match index with 
                | i when i = position -> "green"
                | _ -> aux (index + 1) t "yellow"
              end
              else aux (index + 1) t colour
  in aux 1 (Util.String.explode_string solution) "black"