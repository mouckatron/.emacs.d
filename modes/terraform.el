;;; terraform.el --- load settings for terraform-mode
;;; Commentary:

;;; Code:

;; https://github.com/emacsorphanage/terraform-mode
(require 'terraform-mode)
(add-to-list 'auto-mode-alist '("\\.tf\\'" . terraform-mode))
(add-hook 'terraform-mode-hook #'terraform-format-on-save-mode)

(provide 'terraform)
;;; terraform.el ends here
