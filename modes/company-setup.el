(defun setup-company-mode ()
  "Setup company mode to be more user friendly"
  (eval-after-load 'company
    '(progn
       (company-setup-vars)
       (company-setup-keybindings))))

(defun company-setup-keybindings ()
  "Setup custom keybindings for company-mode"
  (progn
    (message "Setting up company-mode keybindings")
    ;; trigger auto completion on tab or indent based on context
    (define-key company-mode-map (kbd "TAB") 'company-indent-or-complete-common)
    (define-key company-mode-map (kbd "<tab>") 'company-indent-or-complete-common)
    ;; cycle through completions on hitting tab. No need to use arrows
    (define-key company-active-map (kbd "TAB") 'company-complete-common-or-cycle)
    (define-key company-active-map (kbd "<tab>") 'company-complete-common-or-cycle)
    ;; select previous completion on shift + tab
    (define-key company-active-map (kbd "S-TAB") 'company-select-previous)
    (define-key company-active-map (kbd "<backtab>") 'company-select-previous)))

(defun company-setup-vars ()
  "Customize company-mode vars"
  (progn
    (message "Setting up company-mode vars")
    ;; preview current completion inline
    (setq company-frontends
          '(company-pseudo-tooltip-unless-just-one-frontend
            company-preview-frontend
            company-echo-metadata-frontend))
    ;; cancel selections by typing non-matching characters
    (setq company-require-match 'never)
    ;; keys like SPC do NOT finish completion (have to press enter to select completion)
    (setq company-auto-complete nil)
    ;; delay before completion list is shown
    (setq company-idle-delay 0.05)
    ;; wrap back to start once you hit end of completions and vice versa
    (setq company-selection-wrap-around t)
    ;; trigger completion after minimum 2 chars
    (setq company-minimum-prefix-length 2)
    ;; show dabbrev completion based on matching case of input and candidates
    (setq company-dabbrev-ignore-case nil)
    ;; don't downcase candidates coming from dabbrev backend
    (setq company-dabbrev-downcase nil)))

(setup-company-mode)

(provide 'company-setup)
