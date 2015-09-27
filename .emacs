(require 'cl)

(setq user-full-name "Jason Longshore")
(setq user-mail-address "longshorej@gmail.com")

(add-to-list 'load-path "~/.emacs.d/lisp/") 

(load "package")
(package-initialize)

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(setq package-archive-enable-alist '(("melpa" deft magit)))

(load-theme 'base16-default-dark t)
(defvar longshorej/packages '(ac-slime
                              auto-complete
                              ;autopair
                              base16-theme
                              ensime
                              evil
                              flycheck
                              gist
                              haskell-mode
                              htmlize
                              magit
                              markdown-mode
                              marmalade
                              neotree
                              nodejs-repl
                              ;nrepl
                              ;org
                              php-mode
                              puppet-mode
                              restclient
                              rvm
                              scala-mode
                              sml-mode
                              web-mode
                              yaml-mode)
  "Default packages")

(defun longshorej/packages-installed-p ()
  (cl-loop for pkg in longshorej/packages
        when (not (package-installed-p pkg)) do (return nil)
        finally (return t)))

(unless (longshorej/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg longshorej/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

(load-theme 'base16-default-dark t)
(setq inhibit-splash-screen t
      initial-scratch-message nil)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

(delete-selection-mode t)
(transient-mark-mode t)
(setq x-select-enable-clipboard t)
(setq-default indent-tabs-mode nil)
(global-set-key (kbd "TAB") 'tab-to-tab-stop)
(setq evil-want-C-i-jump nil)
(require 'evil)
(evil-mode 1)


(require 'i3)
(require 'i3-integration)
(i3-one-window-per-frame-mode-on)
(i3-advise-visible-frame-list-on)

(setq make-backup-files nil)
(defalias 'yes-or-no-p 'y-or-n-p)
(setq default-tab-width 2
      indent-tabs-mode nil)

(global-linum-mode t)

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (set-face-attribute 'default nil
                      :family "Envy Code R"
                      :height 110
                      :weight 'normal
                      :width 'normal)

  (when (functionp 'set-fontset-font)
    (set-fontset-font "fontset-default"
                      'unicode
                      (font-spec :family "Envy Code R"
                                 :width 'normal
                                 :size 11
                                 :weight 'normal))))

(setq-default indicate-empty-lines t)
(when (not indicate-empty-lines)
  (toggle-indicate-empty-lines))

(require 'neotree)
(global-set-key (kbd "C-n") 'neotree-toggle)
