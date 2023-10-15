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