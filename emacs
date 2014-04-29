(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(truncate-lines t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(ido-mode t)
(setq ido-enable-flex-matching t)

(menu-bar-mode -1)
(tool-bar-mode -1)

(require 'uniquify)

;; (global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)
(global-set-key (kbd "<f5>") 'query-replace-regexp)

(show-paren-mode 1)
(setq-default indent-tabs-mode nil)

(setq truncate-lines t
      visible-bell t
      uniquify-buffer-name-style 'forward
      inhibit-startup-message t
      x-select-enable-clipboard t
      x-select-enable-primary t
      save-interprogram-paste-before-kill t
      apropos-do-all t
      mouse-yank-at-point t
      save-place-file (concat user-emacs-directory "places")
      backup-directory-alist `(("." . ,(concat user-emacs-directory "backups"))))

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; (mapcar 'package-install '(cider clojure-mode haskell-mode magit paredit projectile rainbow-mode zenburn-theme))

(load-theme 'zenburn t)

(global-auto-revert-mode)

(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'python-mode-hook 'flycheck-mode)
(add-hook 'python-mode-hook 'outline-minor-mode)

(require 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching t)
