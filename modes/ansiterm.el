(add-hook 'term-mode-hook (lambda ()
                           (setq-local global-hl-line-mode
                            nil)))
(provide 'ansiterm)
