(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(setq package-list
      '(base16-theme company ensime magit racer rust-mode scala-mode))

; activate all the packages
(package-initialize)

; fetch the list of packages available
;(unless package-archive-contents
  (package-refresh-contents)

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))


(setq-default cursor-type 'bar)
(load-theme 'base16-bright t)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(set-default-font "Envy Code R 10")
(cua-mode t)
;(add-to-list 'default-frame-alist '(font . "Share-TechMonoTrue" ))
;(set-face-attribute 'default t :font "Share-TechMonoTrue" )
					;(set-face-attribute 'default nil :height 50)

(global-set-key [?\C-h] 'delete-backward-char)

(setq c-basic-offset 2) ; indents 4 chars
(setq tab-width 2)          ; and 4 char wide for TAB
(setq indent-tabs-mode nil) ; And force use of spaces
(setq make-backup-files nil)

(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)

(require 'rust-mode)
(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)

(turn-on-font-lock)       ; same as syntax on in Vim


(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(add-hook 'prog-mode-hook 'linum-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (rust-mode scala-mode magit base16-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
