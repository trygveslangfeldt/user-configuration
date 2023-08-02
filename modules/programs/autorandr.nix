# Some settings from https://pastebin.com/S8m1jnY3
{ config, pkgs, ... }:

{
  programs.autorandr = {
    enable = true;
    profiles = {
      adam = {
        fingerprint = {
          DP-0 = "00ffffffffffff0010aceca04c5935300b1d0104b53d23783eee95a3544c99260f5054a54b00714f8180a9c0a940d1c0e100d10001014dd000a0f0703e8030203500615d2100001a000000ff00464e38344b3933413035594c0a000000fc0044454c4c205532373138510a20000000fd0031560a8936000a20202020202001e102031df150101f200514041312110302161507060123091f0783010000565e00a0a0a0295030203500615d2100001aa36600a0f0701f8030203500615d2100001a4dd000a0f0703e8030203500615d2100001a023a801871382d40582c2500615d2100001ebf1600a08038134030203a00615d2100001a00000000000000004a";
          HDMI-0 = "00ffffffffffff0030aee96100000000101f0103803c22782e6665a9544c9d26105054a1080081809500b300d1c0d100a9c081c08100565e00a0a0a0295030203500615d2100001a000000fc00503237682d32300a2020202020000000fd00324c1e5a22000a202020202020000000ff0056393037545747390a2020202001b202031ff14c01020304051413901f120e0f23090f078301000065030c001000011d007251d01e206e28550055502100001e8c0ad08a20e02d10103e960055502100001800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000094";
        };
        config = {
          DP-0 = {
            enable = true;
            crtc = 0;
            mode = "3840x2160";
            position = "3328x0";
            primary = true;
            rate = "60.00";
            # dpi = 144;
            # x-prop-non_desktop = 0;
          };
          HDMI-0 = {
            crtc = 1;
            primary = false;
            position = "0x0";
            mode = "2560x1440";
            filter = "bilinear";
            rate = "59.95";
            # x-prop-non_desktop = 0;
            transform = [
              [ 1.299988 0.000000 0.000000 ]
              [ 0.000000 1.299988 0.000000 ]
              [ 0.000000 0.000000 1.000000 ]
            ];
          };
        };
      };
    };
    hooks = {
      postswitch = {
        notify-i3 = "${pkgs.i3}/bin/i3-msg restart";
        #change-background = "${pkgs.variety}/bin/variety --next";
        change-dpi = ''
          case "$(hostname)" in
            default)
              DPI=96
              ;;
            adam)
              DPI=144
              ;;
            *)
              echo "Unknown profile for host: $(hostname)"
              exit 1
          esac

          echo "Xft.dpi: $DPI" | xrdb -merge
        '';
      };
    };
  };

  services.autorandr.enable = true;
}
