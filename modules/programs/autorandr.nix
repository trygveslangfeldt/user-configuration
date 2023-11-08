# Some settings from https://pastebin.com/S8m1jnY3
{ config, pkgs, ... }:

{
  programs.autorandr = {
    enable = true;
    profiles = {
      baarch = {
        fingerprint = {
        };
        config = {
          DP-1-4 = {
            crtc = 2;
            filter = "bilinear";
            mode = "2560x1440";
            position = "0x0";
            rate = "59.95";
            transform = [
              [ 1.299988 0.000000 0.000000 ]
              [ 0.000000 1.299988 0.000000 ]
              [ 0.000000 0.000000 1.000000 ]
            ];
          };

          DP-1-0 = {
            crtc = 2;
            filter = "bilinear";
            mode = "2560x1440";
            position = "0x0";
            rate = "59.95";
            transform = [
              [ 1.299988 0.000000 0.000000 ]
              [ 0.000000 1.299988 0.000000 ]
              [ 0.000000 0.000000 1.000000 ]
            ];
          };


          eDP-1 = {
            crtc = 4;
            filter = "bilinear";
            mode = "3840x2160";
            position = "7168x0";
            rate = "60.00";
            transform = [
              [ 0.799988 0.000000 0.000000 ]
              [ 0.000000 0.799988 0.000000 ]
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
            adama)
              DPI=144
              ;;
            galactica)
              DPI=138
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
