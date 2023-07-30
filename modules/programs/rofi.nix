# Some settings from https://pastebin.com/S8m1jnY3
{ config, pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    font = ''Liberation Mono 12'';
    theme = ''DarkBlue'';
  };
}
