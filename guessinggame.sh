#!/usr/bin/env bash

count_files() {
    find . -maxdepth 1 -type f | wc -l
}

play_game() {
    local total_files
    local guess
    total_files=$(count_files)

    echo "How many files are in the current directory?"
    while true; do
        read -r -p "Enter your guess: " guess || {
            echo "Input ended. Goodbye!"
            return 1
        }

        if [[ ! $guess =~ ^[0-9]+$ ]]; then
            echo "Please enter a non-negative whole number."
            continue
        fi

        if (( 10#$guess < total_files )); then
            echo "Too low! Try again."
        elif (( 10#$guess > total_files )); then
            echo "Too high! Try again."
        else
            echo "Congratulations! You guessed correctly!"
            break
        fi
    done
}

play_game
