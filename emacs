(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(epg-gpg-program "/usr/local/bin/gpg")
 '(haskell-program-name "ghci \"+.\"")
 '(ispell-highlight-face (quote flyspell-incorrect))
 '(ispell-program-name "/usr/local/bin/aspell")
 '(jedi:complete-on-dot nil)
 '(magit-completing-read-function (quote magit-builtin-completing-read))
 '(purescript-mode-hook (quote (turn-on-purescript-indentation)))
 '(python-fill-docstring-style (quote pep-257))
 '(scss-compile-at-save nil)
 '(sgml-basic-offset 2)
 '(show-trailing-whitespace nil)
 '(truncate-lines t)
 '(whitespace-line-column 140))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#3F3F3F" :foreground "#DCDCCC" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "nil" :family "Menlo"))))
 '(org-level-1 ((t (:foreground "#DFAF8F" :height 1.5 :family "helvetica"))))
 '(org-level-2 ((t (:foreground "#BFEBBF" :height 1.5 :family "helvetica"))))
 '(org-level-3 ((t (:foreground "#7CB8BB" :height 1.5 :family "helvetica"))))
 '(whitespace-hspace ((t nil)))
 '(whitespace-space ((t (:background "#424242")))))

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
(global-set-key (kbd "C-c '") 'helm-git-files)
(global-set-key (kbd "C-c s-3") 'helm-git-grep)
(global-set-key (kbd "s-3") (lambda () (interactive) (insert "#")))

(global-set-key (kbd "M-x") 'helm-M-x)
;; (global-set-key (kbd "C-x b") 'helm-buffers-list)
;; (global-set-key (kbd "C-x C-f") 'helm-find-files)

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; Outline-minor-mode key map
(define-prefix-command 'cm-map nil "Outline-")
;; HIDE
(define-key cm-map "q" 'hide-sublevels)    ; Hide everything but the top-level headings
(define-key cm-map "t" 'hide-body)         ; Hide everything but headings (all body lines)
(define-key cm-map "o" 'hide-other)        ; Hide other branches
(define-key cm-map "c" 'hide-entry)        ; Hide this entry's body
(define-key cm-map "l" 'hide-leaves)       ; Hide body lines in this entry and sub-entries
(define-key cm-map "d" 'hide-subtree)      ; Hide everything in this entry and sub-entries
;; SHOW
(define-key cm-map "a" 'show-all)          ; Show (expand) everything
(define-key cm-map "e" 'show-entry)        ; Show this heading's body
(define-key cm-map "i" 'show-children)     ; Show this heading's immediate child sub-headings
(define-key cm-map "k" 'show-branches)     ; Show all sub-headings under this heading
(define-key cm-map "s" 'show-subtree)      ; Show (expand) everything in this heading & below
;; MOVE
(define-key cm-map "u" 'outline-up-heading)                ; Up
(define-key cm-map "n" 'outline-next-visible-heading)      ; Next
(define-key cm-map "p" 'outline-previous-visible-heading)  ; Previous
(define-key cm-map "f" 'outline-forward-same-level)        ; Forward - same level
(define-key cm-map "b" 'outline-backward-same-level)       ; Backward - same level
(global-set-key "\M-o" cm-map)

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

(load-theme 'zenburn t)

(global-auto-revert-mode)

(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(eval-after-load "haskell-mode"
  '(define-key haskell-mode-map (kbd "C-c C-c") 'haskell-compile))
(setenv "PATH" (concat "/Users/kevin/.cabal/bin:/usr/local/bin:" (getenv "PATH")))
(setq exec-path (append exec-path '("/Users/kevin/.cabal/bin" "/usr/local/bin")))
(eval-after-load "haskell-mode"
  '(progn
     (define-key haskell-mode-map (kbd "C-x C-d") nil)
     (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
     (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-file)
     (define-key haskell-mode-map (kbd "C-c C-b") 'haskell-interactive-switch)
     (define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
     (define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
     (define-key haskell-mode-map (kbd "C-c M-.") nil)
     (define-key haskell-mode-map (kbd "C-c C-d") nil)))


(setenv "PYTHONPATH" (concat "/Users/kevin/w/mvne-platform:" (getenv "PYTHONPATH")))
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'python-mode-hook 'whitespace-mode)

(require 'flycheck-pyflakes)
(add-hook 'python-mode-hook 'flycheck-mode)
(add-hook 'python-mode-hook 'outline-minor-mode)
(add-to-list 'flycheck-disabled-checkers 'python-flake8)
(add-to-list 'flycheck-disabled-checkers 'python-pylint)

(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
(add-hook 'rust-mode-hook 'flycheck-mode)

(add-hook 'org-mode-hook 'org-indent-mode)

(defun toggle-fullscreen ()
  "Toggle full screen"
  (interactive)
  (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth)))
(put 'downcase-region 'disabled nil)


;; (mapcar 'package-install
;;        '(cider clojure-mode paredit
;;          rust-mode haskell-mode scss-mode purescript-mode python-mode
;;          helm helm-ack helm-git-grep helm-git-files
;;          flycheck flycheck-pyflakes
;;          magit
;;          rainbow-mode zenburn-theme))
