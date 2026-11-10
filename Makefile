.PHONY: all

all: README.md

README.md: guessinggame.sh Makefile
	@printf '# Guessing Game\n\n' > README.md
	@printf 'Make was run on: %s\n\n' "$$(date '+%Y-%m-%d %H:%M:%S %Z')" >> README.md
	@printf 'Number of lines in guessinggame.sh: %s\n' "$$(wc -l < guessinggame.sh | tr -d ' ')" >> README.md
