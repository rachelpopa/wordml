type game_state = {
  current_guess: int;
  guesses: string list
} 

let start_game_state = {
  current_guess = 1;
  guesses = [ ""
            ; ""
            ; ""
            ; ""
            ; ""
            ; ""
            ]
}