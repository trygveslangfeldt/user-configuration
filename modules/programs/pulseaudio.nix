{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.pulseaudio
    pkgs.pavucontrol
  ];

  systemd.user.services.pulseaudio = {
    Unit = {
      Description = "Sound service";
      After = [ "graphical-session-pre.target" ];
      PartOf = [ "graphical-session.target" ];
      Requires = "${pkgs.pulseaudio}/pulseaudio.socket";
      ConditionUser= "!root";
    };

    Install = {
      Also = "pulseaudio.socket";
      WantedBy = [ "graphical-session.target" ];
    };

    Service = {
      ExecStart = "${pkgs.pulseaudio}/bin/pulseaudio --daemonize=no --log-target=journal";
      LockPersonality = "yes";
      MemoryDenyWriteExecute = "yes";
      NoNewPrivileges = "yes";
      Restart = "on-failure";
      RestrictNamespaces = "yes";
      SystemCallArchitectures = "native";
      SystemCallFilter = "@system-service";
      Type = "notify";
      UMask = "0077";
      Slice = "session.slice";
    };
  };
}
