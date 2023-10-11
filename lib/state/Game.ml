type game_state = {
  mutable current_guess: int;
  guess1: string;
  guess2: string;
  guess3: string;
  guess4: string;
  guess5: string;
  guess6: string
} 

let start_game_state = {
  current_guess = 1;
  guess1 = "";
  guess2 = "";
  guess3 = "";
  guess4 = "";
  guess5 = "";
  guess6 = ""
}