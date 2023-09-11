{ lib, setDisplay, templates, ... }:
let 
    monitor = ["eDP1"];

in
    setDisplay {
        workspaces = templates;
        display = monitor;
    }
