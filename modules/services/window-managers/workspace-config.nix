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
    "9:browser"
    "10:audio"
    "11:other"
    "12:other"
  ];

  templates = builtins.genList (i: {
    workspace = builtins.elemAt names i;
    output = "";
  }) (builtins.length names);

  displayCount = builtins.length displays;
in
  if configuration == "laptop" then
    setDisplay {
      workspaces = templates;
      display = builtins.elemAt displays 0;
    }
  else if displayCount == 2 then
    (setDisplay {
      workspaces = lib.lists.sublist 0 3 templates;
      display = builtins.elemAt displays 0;
    }) ++
    (setDisplay {
      workspaces = lib.lists.sublist 3 9 templates;
      display = builtins.elemAt displays 1;
    })
  else if displayCount == 3 then
    (setDisplay {
      workspaces = lib.lists.sublist 0 3 templates;
      display = builtins.elemAt displays 0;
    }) ++
    (setDisplay {
      workspaces = lib.lists.sublist 3 3 templates;
      display = builtins.elemAt displays 1;
    }) ++
    (setDisplay {
      workspaces = lib.lists.sublist 6 6 templates;
      display = builtins.elemAt displays 2;
    })
  else
    []
