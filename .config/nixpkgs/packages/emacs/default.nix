{ config, pkgs, fetchFromGitHub, ... }:

let

  emacsConfig = pkgs.runCommand "README" {
    buildInputs = with pkgs; [ emacs ];
  } ''
     install -D ${./README.org} $out/share/emacs/site-lisp/README.org
     cd $out/share/emacs/site-lisp
     emacs --batch --quick -l ob-tangle --eval "(org-babel-tangle-file \"README.org\")"
  '';

  emacsPackages =
    pkgs.emacsPackagesNg.overrideScope
    (self: super: {
      inherit (self.melpaPackages)
        evil flycheck-haskell haskell-mode
        use-package;
    });


in

emacsPackages.emacsWithPackages (epkgs: with epkgs; [
  use-package

  # Interface
  bind-key
  company
  ivy counsel swiper
  projectile  # project management
  counsel-projectile
  ripgrep  # search
  which-key  # display keybindings after incomplete command

  # Themes
  diminish
  all-the-icons
  powerline
  spaceline
  spaceline-all-the-icons
  zerodark-theme

  # Delimiters
  smartparens
  linum-relative
  fringe-helper

  highlight-numbers

  # Evil
  avy
  evil
  evil-org ## or syndicate?
  evil-magit
  evil-indent-textobject
  evil-nerd-commenter
  ## evil-cleverparens ## use lispyville / lispy instead?

  undo-tree
  frames-only-mode
  zoom-window

  # Git
  # git-auto-commit-mode
  # git-timemachine
  magit
  diff-hl

  # Helpers
  direnv

  # Language support
  moonscript
  lua-mode
  json-mode
  yaml-mode
  markdown-mode

  company-quickhelp

  # Go
  go-mode
  company-go
  go-guru
  go-eldoc
  flycheck-gometalinter
  ob-go

  flycheck-checkbashisms

  auto-compile
  flycheck
  flycheck-popup-tip
  flycheck-pos-tip

  string-inflection

  markdown-mode
  pkgs.ledger
  yaml-mode
  web-mode
  pos-tip
  dockerfile-mode
  scala-mode
  js2-mode

  # Haskell
  haskell-mode
  flycheck-haskell
  company-ghci  # provide completions from inferior ghci

  # Org
  org org-ref evil-org org-bullets

  # Rust
  rust-mode cargo flycheck-rust

  # Nix
  nix-mode nix-buffer nixos-options company-nixos-options nix-sandbox

  # config file
  emacsConfig
])
