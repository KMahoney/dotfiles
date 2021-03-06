;; Packages
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(require 'use-package)
(require 'use-package-ensure)
(setq use-package-always-ensure t)

(tool-bar-mode -1)
(menu-bar-mode -1)

;; Customisation
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file)

;; Setup
(fset 'yes-or-no-p #'y-or-n-p)
(setq visible-bell nil)
(setq uniquify-buffer-name-style 'forward)
(setq inhibit-startup-message t)
(setq save-interprogram-paste-before-kill t)
(setq mouse-yank-at-point t)
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory "backups"))))
(setq ispell-dictionary "en_GB")
(set-default 'truncate-lines t)
(require 'uniquify)
(show-paren-mode 1)
(setq-default indent-tabs-mode nil)
(global-auto-revert-mode)
(setq dired-listing-switches "-lFa --group-directories-first")

;; Executable paths
(add-to-list 'exec-path "~/.local/bin")
(add-to-list 'exec-path "~/.cargo/bin")
(add-to-list 'exec-path "~/bin")

;; Custom modules
(add-to-list 'load-path (concat user-emacs-directory "modules"))

;; -------------------------------------------------------------
;; Mac setup
;; -------------------------------------------------------------

(when (eq system-type 'darwin)
  (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
  (add-to-list 'exec-path "/usr/local/bin")
  (setq insert-directory-program "gls")
  (global-set-key (kbd "M-3") (lambda () (interactive) (insert "#"))))

;; -------------------------------------------------------------
;; General Global Keybindings
;; -------------------------------------------------------------

(global-set-key (kbd "<f5>") 'query-replace-regexp)
(global-set-key (kbd "<f6>") 'query-replace)

(global-set-key (kbd "M-[") 'text-scale-decrease)
(global-set-key (kbd "M-]") 'text-scale-increase)

(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; -------------------------------------------------------------
;; Packages
;; -------------------------------------------------------------

(use-package zenburn-theme)

(use-package helm
  :bind (("M-x" . helm-M-x)
         ("C-x b" . helm-buffers-list)
         ("C-x C-f" . helm-find-files)
         ("C-c o" . helm-occur)))

(use-package helm-swoop
  :bind ("C-c n" . helm-swoop))

(use-package magit
  :bind ("C-x g" . magit-status))

(use-package helm-projectile)
(use-package projectile
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :bind (:map projectile-command-map
              ("p" . helm-projectile)
              ("f" . helm-projectile-find-file)
              ("b" . helm-projectile-switch-to-buffer))
  :config
  (projectile-mode))

(use-package undo-tree
  :config
  (global-undo-tree-mode))

(use-package org)

(use-package ripgrep)

(use-package rainbow-mode)

(use-package expand-region
  :bind ("C-=" . er/expand-region))

;; -------------------------------------------------------------
;; Prog modes
;; -------------------------------------------------------------

(use-package elm-mode
  :init
  (setq elm-package-json "elm.json")
  :config
  (add-hook 'elm-mode-hook #'elm-format-on-save-mode)
  (add-hook 'elm-mode-hook #'flycheck-mode))

(use-package flycheck-elm
  :config
  (flycheck-elm-setup))

(use-package dante
  :ensure t
  :after haskell-mode
  :commands 'dante-mode
  :init
  (add-hook 'haskell-mode-hook 'company-mode)
  (add-hook 'haskell-mode-hook 'flycheck-mode)
  (add-hook 'haskell-mode-hook 'dante-mode))

(use-package yaml-mode)

(use-package nix-mode)

(use-package typescript-mode
  :mode ("\\tsx?\\'" . typescript-mode))

(use-package scala-mode)

(use-package markdown-mode
  :config
  (add-hook 'markdown-mode-hook #'flyspell-mode))
