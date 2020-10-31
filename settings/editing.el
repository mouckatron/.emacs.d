(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq require-final-newline t)

(add-hook 'before-save-hook (lambda ()
                              (delete-trailing-whitespace)))

(global-hl-line-mode 1)

(provide 'editing)
