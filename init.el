;;; init.el --- load all my settings
;;; Commentary:

;;; Code:

(package-initialize)

(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq inhibit-startup-message t)

;; Set path to dependencies
(setq settings-dir
      (expand-file-name "settings" user-emacs-directory))
(setq modes-dir
      (expand-file-name "modes" user-emacs-directory))

;; Set up load path
(add-to-list 'load-path settings-dir)
(add-to-list 'load-path modes-dir)

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Setup packages
(require 'setup-package)
(load-library "packages")

;; settings
(load-library "keys")
(load-library "editing")
(load-library "theme")
(load-library "windows")


;; modes
;(load-library "flycheck")
(load-library "ansiterm")
(load-library "git")
(load-library "terraform")
(load-library "typescript")
(load-library "web-mode")

;;; init.el ends here
