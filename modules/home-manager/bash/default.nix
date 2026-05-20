{ ... }:

{
    programs.bash = {
        enable = true;
        initExtra = "fish; exit";
    };
}
