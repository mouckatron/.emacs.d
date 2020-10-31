
(setq shell-file-name "/bin/bash")
(setenv "PATH" (mapconcat 'identity exec-path ":"))

(provide 'environment)
