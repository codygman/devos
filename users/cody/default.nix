{ ... }:
{
  home-manager.users.cody = {
    imports = [ ../profiles/git ../profiles/direnv ];
  };

  users.users.cody = {
    uid = 1000;
    password = "cody";
    description = "default";
    isNormalUser = true;
    # TODO shouldn't have to manually add networkmanager group
    extraGroups = [ "wheel" "docker" "networkmanager"];
  };


  users.users.cody.openssh.authorizedKeys.keyFiles = [
    ../../cody_razer_rsa.pub
  ];

  # TODO should this go somewhere else? The user part being specific is why I put it here
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    configDir = "/home/cody/.config/syncthing";
    user = "cody";
    group = "users";
  };
}
