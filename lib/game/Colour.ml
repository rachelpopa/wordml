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
  in aux 1 (Util.String.explode_string Guess.solution) "grey"

let get_key_colour key guesses =
  let rec aux guess_string = 
    match guess_string with
    | [] -> "light-grey"
    | h::t -> if h = key then (get_colour key ((List.length (h::t)) mod 5))
              else aux t
  in aux (Util.String.explode_string (String.concat "" guesses))
  