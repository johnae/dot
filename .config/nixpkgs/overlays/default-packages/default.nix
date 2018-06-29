self: super: {
  default-packages = self.buildEnv {
    name = "default-packages";
    paths = with self; [
          my-emacs
          # latest.firefox-beta-bin
          firefox-devedition-bin
    ];
  };
}