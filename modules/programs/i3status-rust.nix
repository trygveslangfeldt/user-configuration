{ config, pkgs, isLaptop, ... }:
let

in {
  programs.i3status-rust = {
    enable = true;
    bars = {
      custom = {
        blocks = [
          {
            block = "cpu";
            interval = 1;
            # format = " $icon $barchart ";
          }
          {
            block = "memory";
            format = " $icon $mem_used_percents ";
            warning_mem = 70;
            critical_mem = 90;
          }
          {
            block = "disk_space";
            path = "/";
            info_type = "free";
            interval = 60;
            warning = 10.0;
            alert = 6.0;
            format = " $path - $available ";
          }
          {
            block = "disk_space";
            path = "/home";
            info_type = "free";
            interval = 60;
            warning = 10.0;
            alert = 6.0;
            format = " $path - $available ";
          }
        ] ++ (if isLaptop then [
          {
            block = "battery";
            full_format = " $icon 100% ";
          }
        ] else []) ++
        [
          {
            block = "time";
            interval = 5;
            format = " $timestamp.datetime(f:'%a %d/%m/%y %H:%M:%S') ";
          }
        ];

        icons = "awesome5";
        theme = "modern";
      };
    };
  };
}
