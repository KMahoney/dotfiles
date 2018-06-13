;; Packages
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)


;; Appearance
(tool-bar-mode -1)
(menu-bar-mode -1)
(load-theme 'zenburn t)


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
(setq dired-listing-switches "-lFa --group-directories-first")
(setq tramp-debug-buffer t)

(require 'uniquify)
(show-paren-mode 1)
(setq-default indent-tabs-mode nil)

(global-auto-revert-mode)
(add-hook 'markdown-mode-hook 'flycheck-mode)

(global-undo-tree-mode)

(when (eq system-type 'darwin)
  (setq insert-directory-program "gls")
  (global-set-key (kbd "s-3") (lambda () (interactive) (insert "#"))))


;; General Global Keybindings
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

(global-set-key (kbd "<f5>") 'query-replace-regexp)
(global-set-key (kbd "<f6>") 'query-replace)
(global-set-key (kbd "<f8>") 'projectile-grep)
                                   
(global-set-key (kbd "M-[") 'text-scale-decrease)
(global-set-key (kbd "M-]") 'text-scale-increase)


;; Helm
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-c i") 'helm-semantic-or-imenu)
(global-set-key (kbd "C-x C-n") 'helm-swoop)
(global-set-key (kbd "C-c p") 'helm-projectile-find-file)
(global-set-key (kbd "C-c s") 'helm-git-grep)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-c j") 'helm-occur)
(global-set-key (kbd "C-x r b") 'helm-bookmarks)
(global-set-key (kbd "C-c e") 'helm-etags-select)
(global-set-key (kbd "M-x") 'helm-M-x)


;; Org mode
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c l") 'org-store-link)
(add-hook 'org-mode-hook 'org-bullets-mode)
(add-hook 'org-mode-hook 'flyspell-mode)


;; expand-region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)


(require 'projectile)
(projectile-global-mode)


;; Haskell
(add-hook 'haskell-mode-hook 'haskell-indentation-mode)
(add-hook 'haskell-mode-hook 'intero-mode)


;; Typescript
(add-hook 'typescript-mode-hook 'tide-mode)
(add-hook 'typescript-mode-hook 'flycheck-mode)


;; Rust
;; (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
(add-hook 'rust-mode-hook 'flycheck-mode)
(add-hook 'rust-mode-hook 'cargo-minor-mode)


;; Javascript/flow
(require 'js)
(require 'flycheck-flow)
(add-hook 'js-mode-hook 'flycheck-mode)
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js-jsx-mode))
