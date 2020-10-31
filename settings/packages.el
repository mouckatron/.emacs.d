;;; package --- install required packages

(defun -install-packages ()
  (packages-install
   '(ansible
     company
     company-lsp
     company-terraform
     dockerfile-mode
     dumb-jump
     elpy
     feature-mode
     flycheck
     flymd
     git-gutter
     go-mode
     groovy-mode
     helm
     helm-git
     helm-projectile
     jinja2-mode
     json-mode
     lsp-mode
     lsp-ui
     magit
     markdown-mode
     markdown-mode+
     markdown-preview-eww
     python-mode
     solarized-theme
     systemd
     terraform-mode
     tide
     treemacs
     typescript-mode
     use-package
     web-mode
     yaml-mode
     )))

(condition-case nil
    (-install-packages)
  (error
   (package-refresh-contents)
   (-install-packages)))

(provide 'packages)
