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
 '(package-selected-packages
   (quote
    (helm-ag helm-projectile zoom-window yaml-mode prog-mode org-bullets highlight-numbers markdown-mode dockerfile-mode nlinum nlinum-relative ac-slime web-mode auto-complete ethan-wspace groovy-mode airline-themes moonscript lua-mode json-mode git-gutter evil-leader lua intero powerline evil helm magit use-package))))

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

(menu-bar-mode -1)
(tool-bar-mode -1)

(use-package helm
  :ensure t
  :config
  (require 'helm-config))

(use-package helm-ag
  :ensure t
  :config
  (require 'helm-ag))

(use-package helm-projectile
  :ensure t
  :config
  (require 'helm-projectile)
  (helm-projectile-on))

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
  (powerline-default-theme))

(use-package airline-themes
  :ensure t
  :config
  (require 'airline-themes)
  (load-theme 'airline-dark))

(use-package magit
  :ensure t
  :config
  (require 'magit-wip))

(use-package ethan-wspace
  :ensure t
  :config
  (require 'ethan-wspace))

(use-package evil
  :ensure t
  :config
  (require 'evil)
  (evil-mode 1)
  (define-key evil-normal-state-map (kbd ", <right>") 'split-window-horizontally)
  (define-key evil-normal-state-map (kbd ", <SPC>") 'helm-mini)
  (define-key evil-normal-state-map (kbd ", <down>") 'split-window-vertically)
  (eval-after-load "helm-projectile"
    '(define-key evil-normal-state-map (kbd ", <RET>") 'helm-projectile-ag)))

(use-package git-gutter
  :ensure t
  :config
  (global-git-gutter-mode +1))

(use-package nlinum
  :ensure t
  :config
  (require 'nlinum))

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

(defun auto-complete-mode-maybe ()
  "No maybe for you. Only AC!"
  (unless (minibufferp (current-buffer))
    (auto-complete-mode 1)))

(use-package auto-complete
  :init
  (setq ac-auto-show-menu 0.2
        ac-candidate-limit 50
        ac-delay 0.1
        ac-auto-start 1
        ac-quick-help-delay 0.2
        ac-quick-help-height 10
        ac-ignore-case nil)
  :ensure t
  :config
  (require 'auto-complete)
  (require 'auto-complete-config)
  (ac-config-default)
  (auto-complete-mode-maybe)
  ;;(global-auto-complete-mode t)
  (setq-default ac-sources '(ac-source-yasnippet
                             ac-source-dictionary
                             ac-source-abbrev
                             ac-source-words-in-same-mode-buffers))
  (ac-set-trigger-key "TAB")
  (ac-set-trigger-key "<tab>"))

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
              ("C-c e" . org-edit-src-code)
              ("C-c d" . helm-org-in-buffer-headings))
  :init
  (setq org-log-done 'time
        org-capture-templates '()
        org-src-fontify-natively t
        org-ellipsis " ⤵")
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

(global-set-key (kbd "C-<up>") 'windmove-up)
(global-set-key (kbd "C-<down>") 'windmove-down)
(global-set-key (kbd "C-<left>") 'windmove-left)
(global-set-key (kbd "C-<right>") 'windmove-right)

(setq initial-scratch-message nil)
(setq inhibit-startup-message t)
(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-conservatively 10000
      scroll-step 1
      auto-window-vscroll nil)

(setq tab-stop-list (number-sequence 2 120 2))
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

(setq temporary-file-directory "~/.emacs.d/tmp/")
(unless (file-exists-p "~/.emacs.d/tmp")
  (make-directory "~/.emacs.d/tmp"))

(when (hostname-is "daylight")
  (add-to-list 'default-frame-alist '(font . "Source Code Pro-28"))
  (set-face-attribute 'default t :font "Source Code Pro-28")
  )

(when (hostname-is "starlight")
  (add-to-list 'default-frame-alist '(font . "Source Code Pro-12"))
  (set-face-attribute 'default t :font "Source Code Pro-12")
  )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
