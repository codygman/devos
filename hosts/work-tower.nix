{ suites, ... }:
{
  imports = [
    ./work-tower/configuration.nix
  ] ++ suites.remotedev;

}
