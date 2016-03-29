export EDITOR='nano'
export VISUAL='nano'
export PAGER='less'

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $HOME/bin
  $path
)

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Clean the system script
clean()
{
	rm $(find . -type l -! -exec test -e {} \; -print);
	sudo pacman -Rns $(pacman -Qtdq);
	sudo paccache -r;
	sudo paccache -ruk0;
	sudo pacman -Sc;
	sudo pacman-optimize;
}

# Aliases
alias sf='screenfetch'
