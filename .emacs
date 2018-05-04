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
;;(require 'diminish)
(require 'bind-key)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("721bb3cb432bb6be7c58be27d583814e9c56806c06b4077797074b009f322509" "ef04dd1e33f7cbd5aa3187981b18652b8d5ac9e680997b45dc5d00443e6a46e3" "0e0c37ee89f0213ce31205e9ae8bce1f93c9bcd81b1bcda0233061bb02c357a8" "086970da368bb95e42fd4ddac3149e84ce5f165e90dfc6ce6baceae30cf581ef" "12670281275ea7c1b42d0a548a584e23b9c4e1d2dabb747fd5e2d692bcd0d39b" "e1498b2416922aa561076edc5c9b0ad7b34d8ff849f335c13364c8f4276904f0" "760ce657e710a77bcf6df51d97e51aae2ee7db1fba21bbad07aab0fa0f42f834" "69e7e7069edb56f9ed08c28ccf0db7af8f30134cab6415d5cf38ec5967348a3c" "fec45178b55ad0258c5f68f61c9c8fd1a47d73b08fb7a51c15558d42c376083d" "cea3ec09c821b7eaf235882e6555c3ffa2fd23de92459751e18f26ad035d2142" "e30f381d0e460e5b643118bcd10995e1ba3161a3d45411ef8dfe34879c9ae333" "c79c2eadd3721e92e42d2fefc756eef8c7d248f9edefd57c4887fbf68f0a17af" "d21135150e22e58f8c656ec04530872831baebf5a1c3688030d119c114233c24" "c616e584f7268aa3b63d08045a912b50863a34e7ea83e35fcab8537b75741956" "b563a87aa29096e0b2e38889f7a5e3babde9982262181b65de9ce8b78e9324d5" "25c242b3c808f38b0389879b9cba325fb1fa81a0a5e61ac7cae8da9a32e2811b" "2a998a3b66a0a6068bcb8b53cd3b519d230dd1527b07232e54c8b9d84061d48d" "78c1c89192e172436dbf892bd90562bc89e2cc3811b5f9506226e735a953a9c6" "0c3b1358ea01895e56d1c0193f72559449462e5952bded28c81a8e09b53f103f" "527df6ab42b54d2e5f4eec8b091bd79b2fa9a1da38f5addd297d1c91aa19b616" "36746ad57649893434c443567cb3831828df33232a7790d232df6f5908263692" "3fa07dd06f4aff80df2d820084db9ecbc007541ce7f15474f1d956c846a3238f" "b59d7adea7873d58160d368d42828e7ac670340f11f36f67fa8071dbf957236a" "8cf1002c7f805360115700144c0031b9cfa4d03edc6a0f38718cef7b7cabe382" "64ca5a1381fa96cb86fd6c6b4d75b66dc9c4e0fc1288ee7d914ab8d2638e23a9" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "af717ca36fe8b44909c984669ee0de8dd8c43df656be67a50a1cf89ee41bde9a" "a94f1a015878c5f00afab321e4fef124b2fc3b823c8ddd89d360d710fc2bddfc" "9b1c580339183a8661a84f5864a6c363260c80136bd20ac9f00d7e1d662e936a" "251348dcb797a6ea63bbfe3be4951728e085ac08eee83def071e4d2e3211acc3" "3eb93cd9a0da0f3e86b5d932ac0e3b5f0f50de7a0b805d4eb1f67782e9eb67a4" "2b8dff32b9018d88e24044eb60d8f3829bd6bbeab754e70799b78593af1c3aba" "b181ea0cc32303da7f9227361bb051bbb6c3105bb4f386ca22a06db319b08882" default))
 '(eclim-eclipse-dirs '("~/eclipse/java-oxygen/eclipse"))
 '(eclim-executable "~/.p2/pool/plugins/org.eclim_2.7.1/bin/eclim")
 '(eclimd-default-workspace "~/Development")
 '(package-selected-packages
   '(string-inflection frames-only-mode stickyfunc-enhance base16-theme scala-mode company-emacs-eclim eclim cider clojure-mode lua-mode moonscript flx-ido nim-mode js2-mode ob-zsh ob-bash ob-go org-alert alert org-jira sudo-save flycheck-status-emoji parinfer go-guru go-eldoc flycheck-popup-tip flycheck-clojure flycheck-inline flycheck-checkbashisms flycheck-rust flycheck-pos-tip flycheck-color-mode-line telephone-line telephone-line-config auto-package-update syndicate evil-org evil-org-mode evil-magit ranger which-key direnv git-gutter-fringe diff-hl diff-hl-mode linum-relative flycheck-gometalinter racer rust-mode org-present-mode epresent ivy evil-nerd-commenter company-statistics go-mode company-shell company-go git-gutter-fringe+ fringe-helper git-gutter+ company-quickhelp helm-company elm-mode nlinum-hl helm-ag helm-projectile zoom-window yaml-mode prog-mode org-bullets highlight-numbers markdown-mode dockerfile-mode nlinum nlinum-relative ac-slime web-mode auto-complete ethan-wspace groovy-mode airline-themes json-mode git-gutter evil-leader lua intero powerline evil helm magit use-package))
 '(tramp-syntax 'default nil (tramp)))

(defun prelude-packages-installed-p ()
  (cl-every 'package-installed-p prelude-packages))

(defun system-type-is-darwin ()
  "Return non-nil if system is darwin-based (Mac OS X)."
  (string-equal system-type "darwin")
  )

(defun system-type-is-linux ()
  "Return non-nil if system is GNU/Linux-based."
  (string-equal system-type "gnu/linux")
  )

(defun system-type-is-freebsd ()
  "Return non-nil if system is FreeBSD."
  (string-equal system-type "freebsd")
  )

(defun hostname-is (hostname)
  "Return non-nil if the system we are running on has the given HOSTNAME."
  (or
   (string-equal (system-name) hostname)
   (string-equal (system-name) (concat hostname ".lan"))
   )
  )

(use-package diminish
  :ensure t)

(use-package auto-package-update
  :ensure t
  :config
  (setq auto-package-update-delete-old-versions t
        auto-package-update-interval 4
        auto-package-update-prompt-before-update t)
)
;;  (auto-package-update-maybe))

(use-package which-key
  :diminish (which-key-mode . "")
  :init
  (which-key-mode)
  :ensure t
  :config
  (which-key-setup-side-window-bottom)
  (setq which-key-sort-order 'which-key-key-order-alpha
        which-key-side-window-max-width 0.33
        which-key-idle-delay 0.05)
  )

(use-package ranger
  :ensure t
  :commands (ranger)
  :bind (("C-x d" . deer))
  :config
  (setq ranger-cleanup-eagerly t))

(use-package base16-theme
  :ensure t
  :config
  )

(use-package ivy
  :ensure t
  :config
  (setq ivy-use-virtual-buffers t
        ivy-count-format "%d/%d "))

(use-package flx-ido
  :ensure t
  :init
  (ido-mode 1)
  (ido-everywhere 1)
  (flx-ido-mode 1)
  :config
  (setq ido-enable-flex-matching t
        ido-use-faces nil)
  )

(use-package counsel-projectile
  :diminish (projectile-mode . "")
  :diminish (projectile-mode . "")
  :ensure t
  :config
  (projectile-mode)
  (counsel-projectile-mode))

(use-package pos-tip
  :ensure t)

(use-package web-mode
  :ensure t
  :mode "\\.html?$")

(use-package dockerfile-mode
  :ensure t
  :mode "Dockerfile.*")

(use-package powerline
  :init
  :ensure t
  :config
  (powerline-default-theme)
  (setq powerline-default-separator-dir '(right . left)
        powerline-default-separator 'curve
        powerline-height 20)
  )

(use-package airline-themes
  :ensure t
  :config
  :after (base16-theme powerline))

(use-package magit
  :ensure t
  :config
  (setq magit-repository-directories
        '( "~/Development" ))
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
  )

(use-package parinfer
  :ensure t
  :bind
  (("C-," . parinfer-toggle-mode))
  :init
  (setq parinfer-extensions
        '(defaults       ; should be included.
           pretty-parens  ; different paren styles for different modes.
           evil           ; If you use Evil.
           smart-tab      ; C-b & C-f jump positions and smart shift with tab & S-tab.
           smart-yank))   ; Yank behavior depend on mode.
  (add-hook 'clojure-mode-hook #'parinfer-mode)
  (add-hook 'emacs-lisp-mode-hook #'parinfer-mode)
  (add-hook 'common-lisp-mode-hook #'parinfer-mode)
  (add-hook 'scheme-mode-hook #'parinfer-mode)
  (add-hook 'lisp-mode-hook #'parinfer-mode))

(use-package evil-magit
  :ensure t)

(setq evil-want-C-i-jump nil)
(use-package evil
  :ensure t
  :init
  :config
  (evil-mode 1)
  (define-key evil-normal-state-map (kbd ", <right>") 'split-window-horizontally)
  (define-key evil-normal-state-map (kbd ", <SPC>") 'ivy-switch-buffer)
  (define-key evil-normal-state-map (kbd ", p") 'counsel-projectile-find-file)
  (define-key evil-normal-state-map (kbd ", f") 'counsel-find-file)
  (define-key evil-normal-state-map (kbd ", s") 'swiper)
  (define-key evil-normal-state-map (kbd ", <up>") 'projectile-switch-project)
  (define-key evil-normal-state-map (kbd "P") 'counsel-yank-pop)
  (define-key evil-normal-state-map (kbd ", <down>") 'split-window-vertically)
  (define-key evil-normal-state-map (kbd ", g") 'magit-status)
  (define-key evil-normal-state-map (kbd ", w") 'whitespace-cleanup)
  (define-key evil-normal-state-map (kbd ", <RET>") 'projectile-ag))

(use-package evil-nerd-commenter
  :ensure t
  :config
  (evilnc-default-hotkeys))

(use-package linum-relative
  :ensure t
  :config
  (setq linum-relative-format "%s")
  (setq linum-relative-current-symbol "")
  (global-linum-mode t)
  (linum-relative-mode t))

(use-package fringe-helper
  :init
  (setq-default left-fringe-width  16)
  (setq-default right-fringe-width 16)
  :ensure t
  :config
  )

(use-package direnv
  :ensure t
  :config
  (direnv-mode))

(use-package diff-hl
  :ensure t
  :config
  (global-diff-hl-mode t)
  (diff-hl-flydiff-mode)
  (add-hook 'dired-mode-hook 'diff-hl-dired-mode))

(use-package intero
  :ensure t
  :config
  (add-hook 'haskell-mode-hook 'intero-mode))

(use-package elm-mode
  :ensure t)

(use-package groovy-mode
  :ensure t
  :config
  (setq groovy-indent-offset 2))

(use-package moonscript
  :ensure t
  :mode ("\\Spookfile.*\\'" . moonscript-mode))

(use-package lua-mode
  :ensure t
  :config)

(use-package json-mode
  :ensure t
  :config)

(setq nimsuggest-path "/home/john/Development/Nim/bin/nimsuggest")
(use-package nim-mode
  :ensure t
  :config
  (add-hook 'nim-mode-hook 'nimsuggest-mode))

(add-hook 'nimsuggest-mode-hook 'company-mode)  ; auto complete package
(add-hook 'nimsuggest-mode-hook 'flycheck-mode) ; auto linter package

(use-package company
  :ensure t
  :diminish (company-mode . "")
  :init
  (setq company-idle-delay 0
        company-minimum-prefix-length 2
        company-dabbrev-ignore-case nil
        company-dabbrev-downcase nil)
  :config
  (global-company-mode))

(use-package company-quickhelp
  :ensure t
  :config
  (company-quickhelp-mode 1)
  (setq company-quickhelp-delay 0))

(use-package go-mode
  :ensure t
  )

(use-package go-guru
  :ensure t
  :config
  (go-guru-hl-identifier-mode))

(use-package company-go
  :ensure t
  :config
  (setq gofmt-command "goimports")
  (add-to-list 'company-backends 'company-go)
  (add-hook 'before-save-hook 'gofmt-before-save)
  )

(use-package go-eldoc
  :ensure t
  :config
  (go-eldoc-setup))

(use-package scala-mode
  :ensure t
  :interpreter
  ("scala" . scala-mode))

(use-package js2-mode
  :ensure t
  :config
  (setq js2-strict-missing-semi-warning nil)
  (setq js2-missing-semi-one-line-override t)
  (setq js-indent-level 2)
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode)))

;; Cycle between snake case, camel case, etc.
(use-package string-inflection
  :ensure t
  :config
  (global-set-key (kbd "C-c i") 'string-inflection-cycle)
  (global-set-key (kbd "C-c C") 'string-inflection-camelcase)        ;; Force to CamelCase
  (global-set-key (kbd "C-c L") 'string-inflection-lower-camelcase)  ;; Force to lowerCamelCase
  (global-set-key (kbd "C-c J") 'string-inflection-java-style-cycle) ;; Cycle through Java styles
  )

(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode))

(flycheck-define-checker moonscript-moonpick
  "A MoonScript syntax checker using moonpick.

See URL `https://github.com/nilnor/moonpick'."
  :command ("moonpick" "--filename" source-original "-")
  :standard-input t
  :error-patterns
  (
   (warning line-start "line " line ": " (message) line-end)
   (error line-start " [" line "] >> " (message) line-end))

  :modes (moonscript-mode))

(add-to-list 'flycheck-checkers 'moonscript-moonpick)

(use-package flycheck-popup-tip
  :ensure t)

(use-package flycheck-pos-tip
  :ensure t
  :config
  (setq flycheck-pos-tip-display-errors-tty-function #'flycheck-popup-tip-show-popup)
  (setq flycheck-pos-tip-timeout 0)
  (flycheck-pos-tip-mode))

(use-package flycheck-gometalinter
  :ensure t
  :config
  (setq flycheck-gometalinter-fast t
        flycheck-gometalinter-tests t
        flycheck-gometalinter-deadline "10s")
  (flycheck-gometalinter-setup))

(use-package flycheck-rust
  :ensure t)

(use-package rust-mode
  :ensure t
  :config
  (define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
  (setq company-tooltip-align-annotations t)
  (setq rust-format-on-save t))

(use-package racer
  :ensure t
  :config
  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'eldoc-mode)
  (add-hook 'racer-mode-hook #'company-mode))

(use-package clojure-mode
  :ensure t)

(use-package cider
  :ensure t)

(use-package flycheck-checkbashisms
  :ensure t
  :config
  (flycheck-checkbashisms-setup))

(use-package company-shell
  :ensure t
  :config)

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

(use-package ob-go
  :ensure t)

(setq org-agenda-files '("~/Dropbox/org/"))

(use-package org
  :bind (:map org-mode-map
              ("C-c e" . org-edit-src-code))
  :init
  (setq org-log-done 'time
        org-log-reschedule 'time
        org-src-fontify-natively t
        org-ellipsis " ⤵"
        org-agenda-files '("~/Dropbox/org/")
        org-directory '("~/Dropbox/org/")
        org-enforce-todo-dependencies t
        org-startup-with-beamer-mode t
        org-export-coding-system 'utf-8
        org-todo-keywords
        '((sequence "TODO" "IN-PROGRESS" "WAITING" "|" "DONE" "CANCELED")))
  (setq org-capture-templates
        '(("a" "My TODO task format." entry
           (file "~/Dropbox/org/todos.org")
           "* TODO %?
        SCHEDULED: %t")))
  :ensure t
  :config
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((R . t)
     (emacs-lisp . t)
     (ruby . t)
     (python . t)
     (js . t)
     (java . t)
     (latex . t)
     (haskell . t)
     (clojure . t)
     (go . t)
     (shell . t)
     (sql . t)
     (sqlite . t)
     (groovy . t)
;;(kotlin . t)
;;(typescript . t)
     (C . t)))
  (add-hook 'org-mode-hook 'auto-revert-mode))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)
   (emacs-lisp . nil)))

(use-package evil-org
  :ensure t
  :after org
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook
            (lambda ()
              (evil-org-set-key-theme))))

(defun insane-org-task-capture ()
  "Capture a task with the default template."
  (interactive)
  (org-capture nil "a"))

(defun insane-things-todo ()
  "Return the default todos filepath."
  (interactive)
  (find-file (expand-file-name "~/Dropbox/org/todos.org")))

(use-package org-bullets
  :ensure t
  :init
  (setq org-bullets-bullet-list '("◉"))
  (add-hook 'org-mode-hook 'org-bullets-mode))

(use-package org-jira
  :ensure t
  :init
  (getenv "USER")
  (setq jiralib-url (getenv "JIRA_URL")
        org-jira-working-dir "~/Dropbox/org/jira"
        org-jira-use-status-as-todo t))

(use-package eclim
  :ensure t
  :init
  (custom-set-variables
   '(eclim-eclipse-dirs '("~/eclipse/java-oxygen/eclipse"))
   '(eclim-executable "~/.p2/pool/plugins/org.eclim_2.7.1/bin/eclim")
   '(eclimd-default-workspace "~/Development")
   )
  (setq eclimd-autostart t)
  (defun my-java-mode-hook ()
    (eclim-mode t))
  (add-hook 'java-mode-hook 'my-java-mode-hook))

(use-package company-emacs-eclim
  :ensure t
  :init
  (company-emacs-eclim-setup))

(setq help-at-pt-display-when-idle t)
(setq help-at-pt-timer-delay 0.1)
(help-at-pt-set-timer)

(use-package alert
  :ensure t
  :init
  (setq alert-default-style 'libnotify))

(use-package syndicate
  :ensure t)

(use-package paren
  :ensure t
  :config
  (set-face-background 'show-paren-match (face-background 'default))
  (set-face-foreground 'show-paren-match "#def")
  (set-face-attribute 'show-paren-match nil :weight 'extra-bold)
  (show-paren-mode t))

(use-package yaml-mode
  :ensure t
  :mode "\\.cf$")

(use-package zoom-window
  :ensure t
  :bind* ("C-x C-z" . zoom-window-zoom))

(use-package ac-slime
  :ensure t
  :config
  (add-hook 'slime-mode-hook 'set-up-slime-ac)
  (add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
  (eval-after-load "auto-complete"
    '(add-to-list 'ac-modes 'slime-repl-mode)))

(use-package frames-only-mode
  :ensure t
  :config
  (frames-only-mode))

(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :config
  (define-key evil-normal-state-map (kbd "U") 'undo-tree-visualize)
  (global-undo-tree-mode)
  (setq undo-tree-visualizer-diff t))

;; Sudo helper when editing files owned by root - taken from https://github.com/Fuco1/.emacs.d/blob/master/site-lisp/my-advices.el#L46
(require 'tramp)
(defadvice basic-save-buffer-2 (around fix-unwritable-save-with-sudo activate)
  "When we save a buffer which is write-protected, try to sudo-save it.

When the buffer is write-protected it is usually opened in
read-only mode.  Use \\[read-only-mode] to toggle
`read-only-mode', make your changes and \\[save-buffer] to save.
Emacs will warn you that the buffer is write-protected and asks
you to confirm if you really want to save.  If you answer yes,
Emacs will use sudo tramp method to save the file and then
reverts it, making it read-only again.  The buffer stays
associated with the original non-sudo filename."
  (condition-case err
      (progn
        ad-do-it)
    (file-error
     (when (string-prefix-p
            "doing chmod: operation not permitted"
            (downcase (error-message-string err)))
       (let ((old-buffer-file-name buffer-file-name)
             (success nil))
         (unwind-protect
             (progn
               (setq buffer-file-name (concat "/sudo::" buffer-file-name))
               (save-buffer)
               (setq success t))
           (setq buffer-file-name old-buffer-file-name)
           (when success
             (revert-buffer t t))))))))

;;(when (display-graphic-p)
(menu-bar-mode -1)
(tool-bar-mode -1)

(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(when (display-graphic-p)
  (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)))

(global-set-key (kbd "C-<up>") 'windmove-up)
(global-set-key (kbd "C-k") 'windmove-up)
(global-set-key (kbd "C-<down>") 'windmove-down)
(global-set-key (kbd "C-j") 'windmove-down)
(global-set-key (kbd "C-<left>") 'windmove-left)
(global-set-key (kbd "C-h") 'windmove-left)
(global-set-key (kbd "C-<right>") 'windmove-right)
(global-set-key (kbd "C-l") 'windmove-right)
(define-key global-map (kbd "C-c t") 'insane-org-task-capture)
(define-key global-map (kbd "C-c C-t") 'insane-things-todo)

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "browse")

(setq revert-without-query '("*.org"))

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

(add-to-list 'default-frame-alist '(font . "Source Code Pro-16"))
(set-face-attribute 'default t :font "Source Code Pro-16")

(setq european-date-style 'european)
(setq calendar-set-date-style 'european)
(setq calendar-week-start-day 1)
(setq calendar-date-display-form
      '((if dayname
            (concat dayname ", "))
        day " " monthname " " year))

(setq calendar-time-display-form
      '(24-hours ":" minutes))

(defvar sv-hide-some-holidays nil
  "Non-nil means some holidays won't show in the calendar.")

(defun sv-easter (year)
  "Calculate the date for Easter in YEAR."
  (let* ((century (1+ (/ year 100)))
         (shifted-epact (% (+ 14 (* 11 (% year 19))
                              (- (/ (* 3 century) 4))
                              (/ (+ 5 (* 8 century)) 25)
                              (* 30 century))
                           30))
         (adjusted-epact (if (or (= shifted-epact 0)
                                 (and (= shifted-epact 1)
                                      (< 10 (% year 19))))
                             (1+ shifted-epact)
                           shifted-epact))
         (paschal-moon (- (calendar-absolute-from-gregorian
                           (list 4 19 year))
                          adjusted-epact)))
    (calendar-dayname-on-or-before 0 (+ paschal-moon 7))))

(setq general-holidays
      '((holiday-fixed 1 1 "Nyårsdagen")
        (holiday-fixed 1 6 "Trettondedag jul")

        (holiday-filter-visible-calendar
         (mapcar
          (lambda (dag)
            (list (calendar-gregorian-from-absolute
                   (+ (sv-easter displayed-year) (car dag)))
                  (cadr dag)))
          '((  -2 "Långfredagen")
            (  -1 "Påskafton")
            (   0 "Påskdagen")
            (  +1 "Annandag påsk")
            ( +39 "Kristi himmelfärdsdag")
            ( +49 "Pingstdagen")
            ( +50 "Annandag pingst"))))

        (holiday-fixed 5 1 "Första maj")

        (let ((midsommar-d (calendar-dayname-on-or-before
                            6 (calendar-absolute-from-gregorian
                               (list 6 26 displayed-year)))))
          (holiday-filter-visible-calendar
           (list
            (list
             (calendar-gregorian-from-absolute (1- midsommar-d))
             "Midsommarafton")
            (list
             (calendar-gregorian-from-absolute midsommar-d)
             "Midsommardagen")
            ;; Alla helgons dag
            (list
             (calendar-gregorian-from-absolute
              (calendar-dayname-on-or-before
               6 (calendar-absolute-from-gregorian
                  (list 11 6 displayed-year))))
             "Alla helgons dag"))))

        (holiday-fixed 12 25 "Juldagen")
        (holiday-fixed 12 26 "Annandag jul")))

(setq other-holidays
      '((holiday-fixed 1 13 "Tjogondag Knut")
        (unless sv-hide-some-holidays
          (holiday-fixed 2 2 "Kyndelsmässodagen"))
        (holiday-fixed 2 14 "Alla hjärtans dag")

        (holiday-filter-visible-calendar
         (list
          (list
           (calendar-gregorian-from-absolute
            (calendar-dayname-on-or-before
             2 (- (sv-easter displayed-year) 47)))
           "Fettisdagen")))

        (holiday-fixed 3 8 "Internationella kvinnodagen")
        (holiday-fixed 3 25 "Vårfrudagen")

        (holiday-filter-visible-calendar
         (mapcar
          (lambda (dag)
            (list (calendar-gregorian-from-absolute
                   (+ (sv-easter displayed-year) (car dag)))
                  (cadr dag)))
          (if sv-hide-some-holidays
              '(( -3 "Skärtorsdagen"))
            '(( -7 "Palmsöndagen")
              ( -4 "Dymmelonsdagen")
              ( -3 "Skärtorsdagen")))))

        (unless sv-hide-some-holidays
          (holiday-fixed 4 1 "Första april"))
        (holiday-fixed 4 30 "Valborgsmässoafton")
        (holiday-float 5 0 -1 "Mors dag")
        (holiday-fixed 6 6 "Sveriges nationaldag")
        (holiday-fixed 10 24 "FN-dagen")
        (holiday-float 11 0 2 "Fars dag")
        (unless sv-hide-some-holidays
          (holiday-fixed 11 6 "Gustaf Adolfsdagen"))
        (holiday-fixed 11 10 "Mårtensafton")
        (holiday-float 12 0 -4 "Första advent" 24)
        (holiday-float 12 0 -3 "Andra advent" 24)
        (holiday-float 12 0 -2 "Tredje advent" 24)
        (holiday-float 12 0 -1 "Fjärde advent" 24)
        (holiday-fixed 12 10 "Nobeldagen")
        (holiday-fixed 12 13 "Lucia")
        (holiday-fixed 12 24 "Julafton")
        (holiday-fixed 12 31 "Nyårsafton")))

(setq solar-holidays
      (if sv-hide-some-holidays
          nil
        '((if (fboundp 'atan)
              (solar-equinoxes-solstices))
          (if (progn
                (require 'cal-dst)
                t)
              (funcall 'holiday-sexp calendar-daylight-savings-starts
                       '(format "Sommartid börjar %s"
                                (if
                                    (fboundp 'atan)
                                    (solar-time-string
                                     (/ calendar-daylight-savings-starts-time
                                        (float 60))
                                     calendar-standard-time-zone-name)
                                  ""))))
          (funcall 'holiday-sexp calendar-daylight-savings-ends
                   '(format "Vintertid börjar %s"
                            (if
                                (fboundp 'atan)
                                (solar-time-string
                                 (/ calendar-daylight-savings-ends-time
                                    (float 60))
                                 calendar-daylight-time-zone-name)
                              ""))))))

(setq calendar-holidays
      (append general-holidays holiday-local-holidays
              other-holidays solar-holidays))





                                        ;(add-hook 'calendar-load-hook
                                        ;          (lambda ()
                                        ;            (calendar-set-date-style 'european)))

(when (hostname-is "daylight")
  (when (version< emacs-version "26.0")
    (add-to-list 'default-frame-alist '(font . "Source Code Pro-28"))
    (set-face-attribute 'default t :font "Source Code Pro-28")))

(add-hook 'after-init-hook (lambda () (load-theme (intern (concat "base16-" (or (getenv "THEME") "grayscale-light"))))))
(add-hook 'after-init-hook (lambda () (load-theme (intern (concat "airline-" (or (getenv "AIRLINETHEME") "solarized-gui"))))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
