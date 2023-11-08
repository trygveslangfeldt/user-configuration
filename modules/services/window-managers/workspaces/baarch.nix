{ lib, displays, setDisplay, templates, ... }:
let 
    
in
    (setDisplay {
      workspaces = lib.lists.sublist 0 3 templates;
      display = builtins.elemAt displays 1 ;
    }) ++
    (setDisplay {
      workspaces = lib.lists.sublist 3 6 templates;
      display = builtins.elemAt displays 2;
    })
