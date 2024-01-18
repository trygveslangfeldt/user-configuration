{ lib, setDisplay, templates, ... }:
let 
    monitor = "eDP-1";

in
    setDisplay {
        workspaces = templates;
        display = monitor;
    }
