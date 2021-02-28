{ lib }:
let
  inherit (builtins) mapAttrs isFunction;
  inherit (lib.flk) mkProfileAttrs profileMap;

  profiles = mkProfileAttrs (toString ../profiles);
  users = mkProfileAttrs (toString ../users);

  allProfiles =
    let defaults = lib.collect (x: x ? default) profiles;
    in map (x: x.default) defaults;

  allUsers =
    let defaults = lib.collect (x: x ? default) users;
    in map (x: x.default) defaults;


  suites = with profiles; rec {
    core = [ users.cody users.root ];
    remotedev = core ++ [ graphical.im mosh ssh graphical develop ];
  };
in
mapAttrs (_: v: profileMap v) suites // {
  inherit allProfiles allUsers;
}
