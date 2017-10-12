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
    (dockerfile-mode nlinum nlinum-relative ac-slime web-mode auto-complete ethan-wspace groovy-mode airline-themes moonscript lua-mode json-mode git-gutter evil-leader lua intero powerline evil helm magit use-package))))

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

(defun auto-complete-mode-maybe ()
  "No maybe for you. Only AC!"
  (unless (minibufferp (current-buffer))
    (auto-complete-mode 1)))

(use-package auto-complete
  :ensure t
  :config
  (require 'auto-complete)
  (require 'auto-complete-config)
  (ac-config-default)
  (auto-complete-mode-maybe)
  (global-auto-complete-mode t)
  (setq-default ac-sources '(ac-source-yasnippet
                             ac-source-dictionary
                             ac-source-abbrev
                             ac-source-words-in-same-mode-buffers))
  (ac-set-trigger-key "TAB")
  (ac-set-trigger-key "<tab>")
  (setq ac-auto-start 2)
  (setq ac-ignore-case nil))
  

(use-package ac-slime
  :ensure t
  :config
  (require 'ac-slime)
  (add-hook 'slime-mode-hook 'set-up-slime-ac)
  (add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
  (eval-after-load "auto-complete"
    '(add-to-list 'ac-modes 'slime-repl-mode)))

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
  (define-key evil-normal-state-map ",eh" 'split-window-vertically)
  (define-key evil-normal-state-map ",ev" 'split-window-horizontally))

;;(use-package evil-leader
;;  :ensure t
;;  :config
;;  (require 'evil-leader)
;;  (global-evil-leader-mode))

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
  (add-hook 'prog-mode-hook 'nlinum-relative-mode)
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

(windmove-default-keybindings)
(setq tab-stop-list (number-sequence 2 120 2))
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

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
