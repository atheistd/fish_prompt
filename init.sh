#!/bin/bash

mkdir -p ~/.config/fish/functions

echo -e "\n"
echo -e "Chose either 1, 2 or 3."
echo -e "\n(numeric values are expected)"
echo -e "1. flameboi"
echo -e "2. ringmaster"
echo -e "3. sentinel"

read HOSTNAME

case $HOSTNAME in
	1 )
		cd flameboi/
		cp .zsh_aliases ~/.zsh_aliases
		cp aliases.fish ~/.config/fish/functions/aliases.fish

		cd ../../zsh_prompt
		cp .zshrc ~/.zshrc

		cd ../../fish_prompt
		cp fish_prompt.fish ~/.config/fish/functions/fish_prompt.fish
		;;

	2 )
		cd ringmaster/
		cp .zsh_aliases ~/.zsh_aliases
		cp aliases.fish ~/.config/fish/functions/aliases.fish

		cd ../../zsh_prompt
		cp .zshrc ~/.zshrc

		cd ../../fish_prompt
		cp fish_prompt.fish ~/.config/fish/functions/fish_prompt.fish
		;;

	3 )
		cd sentinel/
		cp .zsh_aliases ~/.zsh_aliases
		cp aliases.fish ~/.config/fish/functions/aliases.fish

		cd ../../zsh_prompt
		cp .zshrc ~/.zshrc

		cd ../../fish_prompt
		cp fish_prompt.fish ~/.config/fish/functions/fish_prompt.fish
		;;

	* )
		clear
		echo -e "You idiot. Run me again now.\nAnd read carefully next time"
		;;
esac


####


cp 
