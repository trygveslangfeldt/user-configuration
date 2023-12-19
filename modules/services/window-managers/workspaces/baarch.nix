{ lib, displays, setDisplay, templates, ... }:
let 
    
in
    (setDisplay {
      workspaces = lib.lists.sublist 0 4 templates;
      display = builtins.elemAt displays 1 ;
    }) ++
    (setDisplay {
      workspaces = lib.lists.sublist 4 5 templates;
      display = builtins.elemAt displays 2;
    })
