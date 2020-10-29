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
(load-library "packages")

;; modes
;(load-library "flycheck")
(load-library "ansiterm")
(load-library "git")
(load-library "golang")
(load-library "terraform")
(load-library "typescript")
(load-library "web-mode")

;; settings
(load-library "ui")
(load-library "keys")
(load-library "editing")
(load-library "theme")
(load-library "windows")


;;; init.el ends here
