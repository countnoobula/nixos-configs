{...}:

{
    wayland.windowManager.hyprland.settings = {
        layerrule = [
            "blur, waybar"
            "blur, swaync-control-center"
            "blur, gtk-layer-shell"
            "xray 1, gtk-layer-shell"
            "xray 1, waybar"
            "ignorezero, waybar"
            "ignorezero, gtk-layer-shell"
            "ignorealpha 0.5, swaync-control-center"
        ];

        windowrule = [
            "float,title:^(swayimg)(.*)$"
        ];

        windowrulev2 = [
            "keepaspectratio,class:^(google-chrome)$,title:^(Picture-in-Picture)$"
            "noborder,class:^(google-chrome)$,title:^(Picture-in-Picture)$"
            "pin,class:^(google-chrome)$,title:^(google-chrome)$"
            "pin,class:^(google-chrome)$,title:^(Picture-in-Picture)$"
            "float,class:^(google-chrome)$,title:^(google-chrome)$"
            "float,class:^(google-chrome)$,title:^(Picture-in-Picture)$"

            "float,class:^(floating)$,title:^(kitty)$"
            "size 50% 50%,class:^(floating)$,title:^(kitty)$"
            "center,class:^(floating)$,title:^(kitty)$"

            "stayfocused, title:^()$,class:^(steam)$"
            "minsize 1 1, title:^()$,class:^(steam)$"

            "float,class:^(moe.launcher.the-honkers-railway-launcher)$"
            # "float,class:^(lutris)$"
            # "size 1880 990,class:^(lutris)$"
            # "center,class:^(lutris)$"

            "fullscreen,class:^steam_app\d+$"
            "monitor 0,class:^steam_app_\d+$"
            "workspace 10,class:^steam_app_\d+$"
        ];

        workspace = [
            "special,gapsin:24,gapsout:64"
            "10,border:false,rounding:false"
        ];
    };
}
