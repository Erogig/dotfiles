{ ... }:

{
    programs.btop = {
        enable = true;
        settings = {
            shown_gpus = "intel";
            vim_keys = true;
        };
    };
}
