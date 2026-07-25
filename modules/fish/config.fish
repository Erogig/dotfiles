# source /etc/profile with bash
if status is-login
    if not set -q __sourced_profile
        set -x __sourced_profile 1
        exec bash -c "\
            test -e /etc/profile && source /etc/profile
            test -e $HOME/.bash_profile && source $HOME/.bash_profile
            exec fish --login
        "
    end
    set -e __sourced_profile
end

if status is-interactive
	source ~/.config/fish/colors.fish
    # Commands to run in interactive sessions can go here
	set fish_color_user $peach
	set fish_color_host $peach
	set fish_color_cwd $green

	abbr -a cl clear
	abbr -a ls 'ls -Ah'
	abbr -a ll 'ls -Ahl'
	abbr -a matrix 'unimatrix -afc yellow -s 97 -l gGkkkSss'
	abbr -a ff 'fastfetch'

    set -x SSH_AUTH_SOCK $HOME/.bitwarden-ssh-agent.sock
end
