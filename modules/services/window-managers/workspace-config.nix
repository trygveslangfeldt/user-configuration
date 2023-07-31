{ lib, displays, ... } :
let
  setDisplay = { workspaces, display }:
  let
    ws = builtins.map (item: item // { output = display; }) workspaces;
  in
    ws;

  names = [
    "1:chromium"
    "2:console"
    "3:gvim"
    "4:gvim"
    "5:console"
    "6:message"
    "7:chromium"
    "8:console"
    "9:ssh"
    "10:email"
    "11:share"
    "12:share"
  ];

  templates = builtins.genList (i: {
    workspace = builtins.elemAt names i;
    output = "";
  }) (builtins.length names);

  displayCount = builtins.length displays;
in
  if displayCount == 1 then
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
      workspaces = lib.lists.sublist 3 5 templates;
      display = builtins.elemAt displays 1;
    }) ++
    (setDisplay {
      workspaces = lib.lists.sublist 5 7 templates;
      display = builtins.elemAt displays 2;
    })
  else
    []
