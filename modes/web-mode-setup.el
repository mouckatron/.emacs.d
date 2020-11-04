;;; web-mode.el --- load settings for web-mode
;;; Commentary:

;;; Code:

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq indent-tabs-mode f)
  (setq-default tab-width 4)
  (setq web-mode-markup-indent-offset 4)
  )
(add-hook 'web-mode-hook  'my-web-mode-hook)
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\template/.*\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.j?html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mako\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.aspx\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.j2\\'" . jinja2-mode))


(setq web-mode-engines-alist
          '(("php" . "\\.php\\'")
                ("django" . "\\.jhtml\\'"))
          )

(provide 'web-mode-setup)
;;; web-mode.el ends here
