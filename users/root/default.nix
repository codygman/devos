{ ... }:
# recommend using `hashedPassword`
{
  users.users.root.password = "";

  users.users.root.openssh.authorizedKeys.keyFiles = [
    ../../cody_razer_rsa.pub
  ];
}
