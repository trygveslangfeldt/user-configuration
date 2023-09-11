{ lib, displays, setDisplay, templates, ... }:
let 
    
in
    (setDisplay {
      workspaces = lib.lists.sublist 0 3 templates;
      display = builtins.elemAt displays 0 ;
    }) ++
    (setDisplay {
      workspaces = lib.lists.sublist 3 6 templates;
      display = builtins.elemAt displays 1;
    })++
    (setDisplay {
      workspaces = lib.lists.sublist 6 9 templates;
      display = builtins.elemAt displays 2;
    })
