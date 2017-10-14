(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3eb93cd9a0da0f3e86b5d932ac0e3b5f0f50de7a0b805d4eb1f67782e9eb67a4" "2b8dff32b9018d88e24044eb60d8f3829bd6bbeab754e70799b78593af1c3aba" "b181ea0cc32303da7f9227361bb051bbb6c3105bb4f386ca22a06db319b08882" default)))
 '(jdee-server-dir "/home/john/.jars")
 '(package-selected-packages
   (quote
    (flycheck-gometalinter racer rust-mode org-present-mode epresent ivy evil-nerd-commenter company-statistics go-mode company-shell company-go git-gutter-fringe+ fringe-helper git-gutter+ company-quickhelp helm-company jdee elm-mode nlinum-hl helm-ag helm-projectile zoom-window yaml-mode prog-mode org-bullets highlight-numbers markdown-mode dockerfile-mode nlinum nlinum-relative ac-slime web-mode auto-complete ethan-wspace groovy-mode airline-themes moonscriT LUA-mode json-mode git-gutter evil-leader lua intero powerline evil helm magit use-package)))
 '(tramp-syntax (quote default) nil (tramp)))

(defun prelude-packages-installed-p ()
  (cl-every 'package-installed-p prelude-packages))

(defun system-type-is-darwin ()
  "Return true if system is darwin-based (Mac OS X)"
  (string-equal system-type "darwin")
  )

(defun system-type-is-linux ()
  "Return true if system is GNU/Linux-based"
  (string-equal system-type "gnu/linux")
  )

(defun system-type-is-freebsd ()
  "Return true if system is FreeBSD"
  (string-equal system-type "freebsd")
  )

(defun hostname-is (hn)
  "Return true if the system we are running on has the given hostname"
  (or
    (string-equal system-name hn)
    (string-equal system-name (concat hn ".lan"))
    )
  )

(use-package ivy
  :ensure t
  :config
  (setq ivy-use-virtual-buffers t
        ivy-count-format "%d/%d "))

(use-package counsel-projectile
  :ensure t
  :config
  (require 'counsel-projectile)
  (counsel-projectile-on))

(use-package pos-tip
  :ensure t
  :config
  (require 'pos-tip))

(use-package web-mode
  :ensure t
  :config
  (require 'web-mode)
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode)))

(use-package dockerfile-mode
  :ensure t
  :config
  (require 'dockerfile-mode)
  (add-to-list 'auto-mode-alist '("Dockerfile.*\\'" . dockerfile-mode)))

(use-package solarized-theme
  :ensure t
  :config
  (load-theme 'solarized-dark t))

(use-package powerline
  :ensure t
  :config
  (require 'powerline)
  (powerline-default-theme)
  (if (display-graphic-p)
      (progn
        (setq powerline-default-separator 'curve)
        (setq powerline-height 20)))
  (setq powerline-default-separator-dir '(right . left)))

(use-package airline-themes
  :ensure t
  :config
  (require 'airline-themes)
  (load-theme 'airline-dark))

(use-package magit
  :ensure t
  :config
  (require 'magit-wip))

(use-package evil
  :ensure t
  :config
  (require 'evil)
  (evil-mode 1)
  (define-key evil-normal-state-map (kbd ", <right>") 'split-window-horizontally)
  (define-key evil-normal-state-map (kbd ", <SPC>") 'ivy-switch-buffer)
  (define-key evil-normal-state-map (kbd ", p") 'counsel-projectile-find-file)
  (define-key evil-normal-state-map (kbd ", <down>") 'split-window-vertically)
  (define-key evil-normal-state-map (kbd ", <RET>") 'counsel-ag))

(use-package evil-nerd-commenter
  :ensure t
  :config
  (require 'evil-nerd-commenter)
  (evilnc-default-hotkeys))

(use-package fringe-helper
  :ensure t)

(use-package git-gutter-fringe+
  :ensure t
  :config
  (global-git-gutter-mode +1))

(use-package nlinum
  :ensure t
  :config
  (require 'nlinum)
  (setq nlinum-format " %d ")
  (global-nlinum-mode 1))

(use-package nlinum-relative
  :ensure t
  :config
  (require 'nlinum-relative)
  (nlinum-relative-setup-evil)
  (global-nlinum-relative-mode 1)
  ;;(add-hook 'prog-mode-hook 'nlinum-relative-mode)
  (setq nlinum-relative-redisplay-delay 0)
  (setq nlinum-relative-current-symbol "")
  (setq nlinum-relative-offset 0))

(use-package intero
  :ensure t
  :config
  (add-hook 'haskell-mode-hook 'intero-mode))

(use-package elm-mode
  :ensure t
  :config
  (require 'elm-mode))

(use-package jdee
  :ensure t
  :config
  (require 'jdee)
  (custom-set-variables
   '(jdee-server-dir "/home/john/.jars")))

(use-package groovy-mode
  :ensure t
  :config
  (require 'groovy-mode)
  (setq groovy-indent-offset 2))

(use-package moonscript
 :ensure t
 :config
 (require 'moonscript)
 (add-to-list 'auto-mode-alist '("Spookfile$" . moonscript-mode)))

(use-package lua-mode
  :ensure t
  :config
  (require 'lua-mode))

(use-package json-mode
  :ensure t
  :config
  (require 'json-mode))

(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0
        company-minimum-prefix-length 2
        company-dabbrev-ignore-case nil
        company-dabbrev-downcase nil)
  (add-hook 'after-init-hook 'global-company-mode))

(use-package company-quickhelp
  :ensure t
  :config
  (require 'company-quickhelp)
  (company-quickhelp-mode 1)
  (setq company-quickhelp-delay 0))

(use-package company-go
  :ensure t
  :config
  (require 'company-go))

(use-package go-mode
  :ensure t
  :config
  (require 'go-mode)
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  (add-hook 'go-mode-hook
            (lambda()
              (set (make-local-variable 'company-backends) '(company-go))
              (company-mode))))

(use-package flycheck-gometalinter
  :ensure t
  :config
  ;; skips 'vendor' directories and sets GO15VENDOREXPERIMENT=1
  (setq flycheck-gometalinter-vendor t)
  ;; only show errors
  (setq flycheck-gometalinter-errors-only t)
  ;; only run fast linters
  (setq flycheck-gometalinter-fast t)
  ;; use in tests files
  (setq flycheck-gometalinter-test t)
  ;; disable linters
  (setq flycheck-gometalinter-disable-linters '("gotype" "gocyclo"))
  ;; Only enable selected linters
  (setq flycheck-gometalinter-disable-all t)
  (setq flycheck-gometalinter-enable-linters '("golint"))
  ;; Set different deadline (default: 5s)
  (setq flycheck-gometalinter-deadline "10s")
  (progn
    (flycheck-gometalinter-setup)))

(use-package rust-mode
  :ensure t
  :config
  (require 'rust-mode)
  (define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
  (setq company-tooltip-align-annotations t)
  (setq rust-format-on-save t))

(use-package racer
  :ensure t
  :config
  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'eldoc-mode)
  (add-hook 'racer-mode-hook #'company-mode))

(use-package company-shell
  :ensure t
  :config
  (require 'company-shell))

(use-package company-statistics
  :ensure t
  :config
  (require 'company-statistics))

(use-package elec-pair
  :init
  (setq electric-pair-pairs
        '((?\" . ?\")
          (?\{ . ?\})))
  :ensure t
  :config
  (electric-pair-mode t)
  (add-hook 'message-mode-hook (electric-pair-mode -1))
  (add-hook 'prog-mode-hook 'electric-pair-mode))

(use-package hl-line
  :init
  (add-hook 'prog-mode-hook 'hl-line-mode)
  :ensure t)

(use-package markdown-mode
  :ensure t)

(use-package highlight-numbers
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'highlight-numbers-mode))

(use-package org
  :bind (:map org-mode-map
              ("C-c e" . org-edit-src-code))
  :init
  (setq org-log-done 'time
        org-capture-templates '()
        org-src-fontify-natively t
        org-ellipsis " ⤵"
        org-todo-keywords
        '((sequence "TODO" "FEEDBACK" "VERIFY" "|" "DONE" "DELEGATED")))
  :ensure t)

(use-package org-bullets
  :ensure t
  :init
  (setq org-bullets-bullet-list '("◉"))
  (add-hook 'org-mode-hook 'org-bullets-mode))

(use-package paren
  :ensure t
  :config
  (show-paren-mode t))

(use-package yaml-mode
  :ensure t)

(use-package zoom-window
  :ensure t
  :bind* ("C-x C-1" . zoom-window-zoom))

(use-package ac-slime
  :ensure t
  :config
  (require 'ac-slime)
  (add-hook 'slime-mode-hook 'set-up-slime-ac)
  (add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
  (eval-after-load "auto-complete"
    '(add-to-list 'ac-modes 'slime-repl-mode)))

;;(windmove-default-keybindings)

(menu-bar-mode -1)
(tool-bar-mode -1)

(global-set-key (kbd "C-<up>") 'windmove-up)
(global-set-key (kbd "C-<down>") 'windmove-down)
(global-set-key (kbd "C-<left>") 'windmove-left)
(global-set-key (kbd "C-<right>") 'windmove-right)

(setq mode-require-final-newline nil)
(setq initial-scratch-message nil)
(setq inhibit-startup-message t)
(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-conservatively 10000
      scroll-step 1
      scroll-preserve-screen-position t
      auto-window-vscroll nil)

(setq tab-stop-list (number-sequence 2 120 2))
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq tabify nil)

;; Highlight trailing whitespace.
(setq-default show-trailing-whitespace t)
(set-face-background 'trailing-whitespace "yellow")



(setq temporary-file-directory "~/.emacs.d/tmp/")
(unless (file-exists-p "~/.emacs.d/tmp")
  (make-directory "~/.emacs.d/tmp"))

(setq make-backup-files nil) ; don't create backup~ files
(setq auto-save-default nil) ; don't create #autosave# files

(add-to-list 'default-frame-alist '(font . "Source Code Pro-12"))
(set-face-attribute 'default t :font "Source Code Pro-12")

(when (hostname-is "daylight")
  (when (version< emacs-version "26.0")
    (add-to-list 'default-frame-alist '(font . "Source Code Pro-28"))
    (set-face-attribute 'default t :font "Source Code Pro-28")))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
