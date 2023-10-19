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
  in aux 0 (Util.String.explode_string Guess.solution) "grey"

let get_guess_colour guess letter_guess position =
  let colour = get_colour letter_guess position
  in if colour = "yellow" then 
    begin
      let rec aux i guess_letters =
        match guess_letters with
        | [] -> colour
        | h::t -> if (h = letter_guess) && (i <> position) then
                    begin
                      match get_colour letter_guess i with
                      | other_colour when other_colour = "green" -> "grey"
                      | _ -> colour
                    end
                  else  aux (i + 1) t
      in aux 0 (Util.String.explode_string guess)
    end
  else colour

let get_key_colour key guesses =
  let rec aux guess_string colour = 
    if colour = "green" then colour
    else
      match guess_string with
      | [] -> colour
      | h::t -> if h = key then let () = print_endline((Char.escaped key) ^ string_of_int ((List.length (guess_string)))) in
                    aux t (get_colour key (((List.length guess_string) - 1) mod 5))
                else aux t colour
  in aux (List.rev(Util.String.explode_string (String.concat "" guesses))) "light-grey"
