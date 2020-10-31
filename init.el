;;; init.el --- load all my settings
;;; Commentary:

;;; Code:

(if (eq system-type 'gnu/linux)
    (package-initialize)
    (print "nope"))

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
(require 'packages)

;; modes
;(require "flycheck")
(require 'ansiterm)
(require 'git)
(require 'golang)
(require 'terraform)
(require 'typescript)
(require 'web-mode)

;; settings
(require 'ui)
(require 'keys)
(require 'editing)
(require 'theme)
(require 'windows)

;;; init.el ends here
