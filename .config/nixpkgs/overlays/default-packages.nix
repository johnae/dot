self: super: {
  default-packages = self.buildEnv {
    name = "default-packages";
    paths = with self; [
          my-emacs
          latest.firefox-beta-bin
          dropbox
          signal-desktop
          awscli
          my-google-cloud-sdk
          slack
          direnv
    ];
  };
}
