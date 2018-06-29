{
  allowUnfree = true;

  # packageOverrides = super: let pkgs = super.pkgs; in with pkgs; rec {
  #   default-env = pkgs.buildEnv {
  #     name = "default-env";
  #     paths = [
  #         ## my emacs config
  #         my-emacs

  #         ## go linters / helpers etc
  #         # gometalinter
  #         # deadcode
  #         # errcheck
  #         # gas
  #         # goconst
  #         # gocyclo
  #         # golint
  #         # govet
  #         # ineffassign
  #         # interfacer
  #         # maligned
  #         # megacheck
  #         # structcheck
  #         # unconvert

  #     ];
  #   };
  # };
}
