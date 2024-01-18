{ lib, displays, configuration, ... } :
let
  setDisplay = { workspaces, display }:
  let
    ws = builtins.map (item: item // { output = display; }) workspaces;
  in
    ws;

  names = [
    "1:browser"
    "2:console"
    "3:gvim"
    "4:ide"
    "5:ide"
    "6:browser"
    "7:chats"
    "8:console"
    "9:audio"
  ];

  templates = builtins.genList (i: {
    workspace = builtins.elemAt names i;
    output = "";
  }) (builtins.length names);

  displayCount = builtins.length displays;
  
  workspaceConfiguration = import ./workspaces/${configuration}.nix {
    inherit lib names displays setDisplay templates;
  };

in
    workspaceConfiguration
