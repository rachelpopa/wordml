var game_state = {
    current_guess: 1,
    guess1: "",
    guess2: "",
    guess3: "",
    guess4: "",
    guess5: "",
    guess6: ""
}

var guessKey = "guess" + game_state.current_guess;

function keyPressed(event) {
    gameInput(event.key)
}

function gameInput(key) {
    if("enter" === key.toLowerCase()) {
        document.getElementById("game-form").submit();
    } 
    else if ("backspace" === key.toLowerCase() || "delete" === key.toLowerCase()) {
        removeLetter();
    }
    else {
        addLetter(key.toUpperCase());
    }
    console.log(game_state[guessKey]);
}

function removeLetter() {
    if(game_state[guessKey].length > 0) {
        game_state[guessKey] = game_state[guessKey].slice(0, -1);
        document.getElementById(guessKey + "-" + (game_state[guessKey].length + 1)).innerHTML = "";
    }
}

function addLetter(letter) {
    if(game_state[guessKey].length < 5) {
        game_state[guessKey] = (game_state[guessKey] + letter);
        document.getElementById(guessKey + "-" + game_state[guessKey].length).innerHTML = letter;
    }
}
