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
      ai-source = inputs.esek-ai.source;
    in
    {
      programs.opencode = {
        enable = true;
        settings = builtins.fromJSON ( builtins.replaceStrings ["<token goes here>"] [(builtins.replaceStrings ["\n"] [""] (builtins.readFile /secrets/esek/opencode.key))] (builtins.readFile (ai-source + "/opencode-template.jsonc")) );
        agents = ai-source + "/agents";
        commands = ai-source + "/commands";
        cli = {
          session = {
            sidebar = "hide";
            thinking = "show";
          };
        };
      };
    };
}
