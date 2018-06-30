self: super: {
  default-packages = self.buildEnv {
    name = "default-packages";
    paths = with self; [
          my-emacs
          firefox-devedition-bin
          dropbox
          signal-desktop
          google-cloud-sdk
          docker-credential-gcr
          awscli
    ];
  };
}