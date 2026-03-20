{ pkgs, ... }:

{
    programs.steam = {
        enable = true;
    };

    programs.gamescope = {
        enable = true;
        env = {
            __NV_PRIME_RENDER_OFFLOAD="1";
            __NV_PRIME_RENDER_OFFLOAD_PROVIDER="NVIDIA-G0";
            __GLX_VENDOR_LIBRARY_NAME="nvidia";
            __VK_LAYER_NV_optimus="NVIDIA_only";
        };
        args = [
            "--prefer-vk-device"
            "--expose-wayland"
            "-w 2560"
            "-h 1440"
            "-s 0.5"
            "--force-windows-fullscreen"
            "-r 170"
            "-o 30"
        ];
    };
}
