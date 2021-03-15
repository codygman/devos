{ inputs }: with inputs;
let
  hmModules = { };
in
{
  modules = [
    home.nixosModules.home-manager
    ci-agent.nixosModules.agent-profile
  ];

  overlays = [
    nur.overlay
    emacs-overlay.overlay
    devshell.overlay
    (final: prev: {
      deploy-rs = deploy.packages.${prev.system}.deploy-rs;
    })
  ];

  # passed to all nixos modules
  specialArgs = {
    inherit hmModules;

    overrideModulesPath = "${override}/nixos/modules";
    hardware = nixos-hardware.nixosModules;
    easy-hls-nix = easy-hls-nix.defaultPackage.x86_64-linux;
  };
}
