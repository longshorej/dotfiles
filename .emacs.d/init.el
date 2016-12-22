;; global variables
(setq
 inhibit-startup-screen t
 create-lockfiles nil
 make-backup-files nil
 column-number-mode t
 scroll-error-top-bottom t
 show-paren-delay 0.5
 use-package-always-ensure t
 sentence-end-double-space nil)

(menu-bar-mode -1)
(tool-bar-mode -1)
(set-default 'truncate-lines t)
(global-linum-mode t)

;; buffer local variables
(setq-default
 indent-tabs-mode nil
 tab-width 4
 c-basic-offset 4)

;; modes
(electric-indent-mode 0)

;; global keybindings
(global-unset-key (kbd "C-z"))

;; the package manager
(require 'package)
(setq
 package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                    ("org" . "http://orgmode.org/elpa/")
                    ("melpa" . "http://melpa.org/packages/")
                    ("melpa-stable" . "http://stable.melpa.org/packages/"))
 package-archive-priorities '(("melpa-stable" . 1)))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(use-package evil
  :demand)

(use-package evil-rsi)

(use-package ensime
  :ensure t
  :pin melpa-stable)


(require 'evil)
(evil-mode 1)


(use-package base16-theme
  :ensure t)

(load-theme 'base16-default-dark t)

(define-key global-map (kbd "RET") 'newline-and-indent)
