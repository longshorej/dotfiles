(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(setq package-list
      '(ag
	base16-theme
	company
	counsel
	dirtree
	ensime
	find-file-in-project
  go-mode
	haskell-mode
	magit
	markdown-mode
	racer
	rust-mode
	scala-mode))

; activate all the packages
(package-initialize)

; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))



(setq-default cursor-type 'bar)
(load-theme 'base16-chalk t)
(set-background-color "#000000")
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(set-default-font "Envy Code R 10")
(cua-mode t)
(ivy-mode t)
(setq backup-inhibited t)
(setq auto-save-default nil)
(setq make-backup-files nil)

					; ivy, tab dont enter
;(define-key ivy-minibuffer-map (kbd "TAB") 'ivy-partial)


; disable annoying prompt stuff
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)



(setq kill-buffer-query-functions
  (remq 'process-kill-buffer-query-function
	kill-buffer-query-functions))
(setq confirm-nonexistent-file-or-buffer nil)
(fset 'yes-or-no-p 'y-or-n-p)
(defadvice yes-or-no-p (around hack-exit (prompt))
   (if (string= prompt "Active processes exist; kill them and exit anyway? ")
       t
      ad-do-it))

;(add-to-list 'default-frame-alist '(font . "Share-TechMonoTrue" ))
;(set-face-attribute 'default t :font "Share-TechMonoTrue" )
					;(set-face-attribute 'default nil :height 50)

(global-set-key [?\C-h] 'delete-backward-char)
(global-set-key (kbd "C-w") 'backward-kill-word)

(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "M-p") 'find-file-in-project)

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
