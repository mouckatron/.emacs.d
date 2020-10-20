(add-to-list 'exec-path "/opt/go/bin")
(add-hook 'go-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'gofmt-before-save)
            (setq-default)
            (setq tab-width 2)
            (setq standard-indent 2)
            (setq indent-tabs-mode nil)))
