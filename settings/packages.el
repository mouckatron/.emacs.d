;;; package --- install required packages

(defun init--install-packages ()
  (packages-install
   '(ansible
     auto-complete
     company
     company-terraform
     dockerfile-mode
     dumb-jump
     elpy
     feature-mode
     flycheck
     flymd
     git-gutter
     go-autocomplete
     go-mode
     groovy-mode
     helm
     helm-git
     helm-projectile
     jinja2-mode
     json-mode
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
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))
