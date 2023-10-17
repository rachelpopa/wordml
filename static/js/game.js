var game_state = {
    current_guess: 1,
    guess1: "",
    guess2: "",
    guess3: "",
    guess4: "",
    guess5: "",
    guess6: ""
}

var guessKey;

document.addEventListener('DOMContentLoaded', function() {
    loadGameStateFromForm()
 }, false);

function loadGameStateFromForm() {
    game_state.current_guess = document.getElementById("current_guess").value;
    for(i = 1; i <= 5; i++) {
        game_state["guess" + i] = document.getElementById("guess" + i).value;
    }
    guessKey = "guess" + game_state.current_guess;
}

function keyPressed(event) {
    gameInput(event.key)
}

function gameInput(key) {
    if("enter" === key.toLowerCase()) {
        submitGuess();
    } 
    else if ("backspace" === key.toLowerCase() || "delete" === key.toLowerCase()) {
        removeLetter();
    }
    else if(key.length === 1 && key.toUpperCase().match(/[A-Z]/i)) {
        addLetter(key.toUpperCase());
    }
    console.log(game_state[guessKey]);
}

function submitGuess() {
    if (game_state[guessKey].length === 5) {
        document.getElementById("game-form").submit();
    }
}

function removeLetter() {
    if(game_state[guessKey].length > 0) {
        game_state[guessKey] = game_state[guessKey].slice(0, -1);
        document.getElementById(guessKey + "-" + (game_state[guessKey].length + 1)).innerHTML = "";
        document.getElementById(guessKey).value = game_state[guessKey];
    }
}

function addLetter(letter) {
    if(game_state[guessKey].length < 5) {
        game_state[guessKey] = (game_state[guessKey] + letter);
        document.getElementById(guessKey + "-" + game_state[guessKey].length).innerHTML = letter;
        document.getElementById(guessKey).value = game_state[guessKey];
    }
}
