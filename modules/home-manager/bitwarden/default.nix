{ pkgs, ... }:

{
    home.packages = [
        pkgs.bitwarden-desktop
    ];

    sshAuthSock.initialization.bash = "export SSH_AUTH_SOCK=$HOME/.bitwarden-ssh-agent.sock";
    sshAuthSock.initialization.fish = "set -x SSH_AUTH_SOCK $HOME/.bitwarden-ssh-agent.sock";
}
