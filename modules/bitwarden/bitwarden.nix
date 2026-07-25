{ ... }: {
  flake.nixosModules.bitwarden = {
    pkgs,
    ...
  }: {
    
  };

  flake.homeModules.bitwarden = {
    pkgs,
    ...
  }: {
    home.packages = with pkgs; [
      bitwarden-desktop
    ];

    sshAuthSock.initialization = {
      bash = "export SSH_AUTH_SOCK=$HOME/.bitwarden-ssh-agent.sock";
      fish = "set -x SSH_AUTH_SOCK $HOME/.bitwarden-ssh-agent.sock";
    };
  };
}
