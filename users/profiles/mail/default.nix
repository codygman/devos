{
  programs = {
    mbsync.enable = true;
    msmtp.enable = true;
    notmuch = {
      enable = false;
      hooks = {
        preNew = "mbsync --all";
      };
    };
  };

}
