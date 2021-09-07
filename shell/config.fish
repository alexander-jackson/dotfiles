# Add the pdflatex command to the terminal path
set PATH /Users/alexander/bin $PATH

# Prevents ~/.bash_history from saving duplicate commands
set HISTCONTROL ignoredups

set CLICOLOR 1
set LSCOLORS ExFxBxDxCxegedabagacad

# Ensure all editors open in NeoVim
set -Ux EDITOR /usr/local/bin/nvim
set -Ux GIT_EDITOR /usr/local/bin/nvim

# Add .cargo/bin to the PATH
set PATH $HOME/.cargo/bin $PATH

# Add the ripgrep config file
set -x RIPGREP_CONFIG_PATH "$HOME/.config/ripgrep/.ripgreprc"

# Enable the autojump command family
begin
	set --local AUTOJUMP_PATH $HOME/.autojump/share/autojump/autojump.fish
	if test -e $AUTOJUMP_PATH
		source $AUTOJUMP_PATH
	end
end

# Add `llvm` to the PATH
set PATH /usr/local/opt/llvm/bin $PATH

# Add `vector` to the PATH
set PATH "$HOME/.vector/bin" $PATH

# Store the default keyboard repeat information here
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1

# Override the mouse acceleration settings
defaults write -g com.apple.mouse.scaling -1

# Make fd the default search for fzf
set -x FZF_DEFAULT_COMMAND 'fd --type f'
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

set -U fish_greeting

# Set the directory for `rhack`ing
set -x RHACK_DIR "$HOME/.cargo/rhack"
