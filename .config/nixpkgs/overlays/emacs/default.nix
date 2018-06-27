self: super: {
  my-emacs = self.callPackage ../../packages/emacs/default.nix { };
}
