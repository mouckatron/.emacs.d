;;; windows.el --- Nice window layout
;;; Commentary:

;;; Code:
(toggle-frame-maximized)
(treemacs)
(other-window 1)
(split-window-below)
(enlarge-window 12)
(other-window 1)
(ansi-term "/bin/bash")

(provide 'windows)
;;; windows.el ends here
