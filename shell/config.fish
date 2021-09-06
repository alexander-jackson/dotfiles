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

set -gx STARLING_ACCESS_TOKEN "eyJhbGciOiJQUzI1NiIsInppcCI6IkdaSVAifQ.H4sIAAAAAAAA_31Sy5KbMBD8lS3OO1uAeRhue8sP5AOG0WCrDBIlid1spfLvEUgY42zlpu6eV2vmdyKtTdoEJwmCR_1mHZpBqkuH6vZGekxeEzt3PuLEpz7j9AQNMkFRN2fouOngzEVZM2ZlXZIP5l9T0mbVKS2bvG6a10Sii0RanRYCifSs3A89CDY_pfC181o0NdcFFNz42qLvoTthCT2dKWXCqsl7X9vpG6uQgWfKm7ysIT2nORTnroTzSRTQ1VVVUF5lxJnP8LbeidjamJV7C5kogSpMoUipg0b0HWTcp12WpRV2zWKY9MRLeJgUruuooHDk1jCKlyfBfU1PghSsnOwlmyM_SOsOTARCGD9ky0K6OwiKc0jXke-RO_400vELzu6qjbR-ZSCVkB9SzDiE4A4HVBRHIzQCSCtn9BAaLUzUtOqlGdFJrUD30M9K2Ltk7903EFrTbJ0eN4s8ooyFB_aDqEuL0zR83dEaNaIS6LgVPLAvscGomRu7xchkuGfDfnb7PymMEbRpQGL_A44vZvXxmPivGFPZ0BU3dyM79NNgSx6uasSrqQm_mDcpgGgigD0I5IiX6Clo-xOcQWWR9gk9Dd083Nptk7xTe7eA94YBbwWWe_C3NUq31xw0-Tt4qLASoJeDeGZjltG9HLbxg58DtUYZJpaTOwB7lMLnWvzwC7Nw0fscBy66OXBrnUcmfJhf-XcldvGbWrsYitKVxTywgPhhkWbnvMF5itDheq2gjXjoeWS3Zkf2m3zQn-rOO17XRPbjmZpEH6m5s2T8Fy7XsXV55NaoxxNat_R8U8mfv0kXPtrXBQAA.WeRPzIQ45X6QCpm9qcDUl0M9Ri_XtdpjZL408Y3LGckwELTB9APoGlzjWowNNmBei4UlgZGkId0b3oRYqUWH3H7Z3ZNXJ1w20SJKdb8y66uVfr3mQrWc6C0RDpXdbXVDpImlB4vf456qmFV3a86dnnaXzJ4irFCGZWpoVYUCETGrp4XN7zHwFZHtpS35uvfbn3rT4qGrya4-MENypSwn6mT-ON6UfL43LqW7wiXIYtnBh2ecDrEJ4JLeEeI5h-lWN3WrzIpKfhqy9SAjCsQXLQzl2SsN5f2DkdXw54VquEzF-awX1v6rEGU5s7g3gIOgE90mpngXWYzWbs7vSjiXfYsg9Y3IGUzExu1Ly7qfTAl1j5FUTo0zOuWKBJ8fc9KJmG7_GTwsJq-scqSP3Sv-OgXZlBpiHHBAEUMrZqa-F1RIai-Cnrc-7-_h1U8sKLLTjL99H-1caIZUtvad_w4OFAS_dHn_wdv4Wu6zah2bFSojOxqWekS65DyQ4KJ3dc361N8wb89XNjVfDCVKc9K1NLgXoe8A1qqphQfMWntkO01G6jlpI5Zw3c4dvnxgNfjMLgJC2fNUAiZ63ycv3dcivvHP8iQCUARRVeC2KQ4aN-CDXYtVuhoE71Bh6GgVR-eVgrRuCRUnhcKPnd5W9-1bDbQm3bJPERJtMcosbNpcKac"
