;;; Run these commands
;;; go get golang.org/x/tools/cmd/...
;;; go get github.com/rogpeppe/godef
;;; go get -u github.com/nsf/gocode
;;; go get golang.org/x/tools/cmd/goimports
;;; go get -u golang.org/x/lint/golint
;;; go get golang.org/x/tools/gopls@latest

(setq lsp-gopls-staticcheck t)
(setq lsp-eldoc-render-all t)
(setq lsp-gopls-complete-unimported t)

(add-to-list 'exec-path "/opt/go/bin")
(add-to-list 'exec-path "~/golang/bin")

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook (go-mode . lsp-deferred))

;;Set up before-save hooks to format buffer and add/delete imports.
;;Make sure you don't have other gofmt/goimports hooks enabled.

(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
                                        ;(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)
(defun old-school-save-hooks ()
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save))
(add-hook 'go-mode-hook 'old-school-save-hooks)

;;Optional - provides fancier overlays.

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :init
)

;;Company mode is a standard completion package that works well with lsp-mode.
;;company-lsp integrates company mode completion with lsp-mode.
;;completion-at-point also works out of the box but doesn't support snippets.

(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1))

(use-package company-lsp
  :ensure t
  :commands company-lsp)

;;lsp-ui-doc-enable is false because I don't like the popover that shows up on the right
;;I'll change it if I want it back


(setq lsp-ui-doc-enable nil
      lsp-ui-peek-enable t
      lsp-ui-sideline-enable t
      lsp-ui-imenu-enable t
      lsp-ui-flycheck-enable t)


(defun custom-go-mode ()
  (display-line-numbers-mode 1)
  (setq tab-width 2)
  (setq standard-indent 2)
  (setq indent-tabs-mode nil))

(use-package go-mode
:defer t
:ensure t
:mode ("\\.go\\'" . go-mode)
:init
(setq compilation-environment (list
                               (format "PATH=%s" (mapconcat 'identity exec-path ":"))))
(setq compile-command "echo Building... && go build -v && echo Testing... && go test -v && echo Linter... && golint")
(setq compilation-read-command nil)
(add-hook 'go-mode-hook 'custom-go-mode)
:bind (("M-," . compile)
       ("M-." . godef-jump)))

(setq compilation-window-height 14)
(defun my-compilation-hook ()
  (when (not (get-buffer-window "*compilation*"))
    (save-selected-window
      (save-excursion
	(let* ((w (split-window-vertically))
	       (h (window-height w)))
	  (select-window w)
	  (switch-to-buffer "*compilation*")
	  (shrink-window (- h compilation-window-height)))))))
(add-hook 'compilation-mode-hook 'my-compilation-hook)

(global-set-key (kbd "C-c C-c") 'comment-or-uncomment-region)
(setq compilation-scroll-output t)

(provide 'golang)
