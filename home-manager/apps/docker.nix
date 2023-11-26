{ pkgs, user, lib, ... }:

{
  home.activation.addUserToDocker = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    ${pkgs.sudo}/bin/sudo ${pkgs.shadow}/bin/usermod -aG docker ${user}
  '';
}

