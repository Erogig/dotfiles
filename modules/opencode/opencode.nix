{ ... }: {
  flake.nixosModules.opencode =
    {
      pkgs,
      ...
    }:
    {

    };

  flake.homeModules.opencode =
    {
      pkgs,
      lib,
      inputs,
      ...
    }:
    let
      
    in
    {
      programs.opencode = {
        enable = true;
        settings = builtins.fromJSON ( builtins.replaceStrings ["<token goes here>"] [(builtins.replaceStrings ["\n"] [""] (builtins.readFile /secrets/esek/opencode.key))] (builtins.readFile ./ai/opencode-template.jsonc) );
        agents = ./ai/agents;
        commands = ./ai/commands;
      };
    };
}
