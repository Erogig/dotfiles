{ ... }: {
  flake.nixosModules.vscode =
    {
      pkgs,
      ...
    }:
    {

    };

  flake.homeModules.vscode =
    {
      pkgs,
      ...
    }:
    {
      programs.vscode.enable = true;
    };
}
