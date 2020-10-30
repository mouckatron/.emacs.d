;;; Run these commands
;;; go get golang.org/x/tools/cmd/...
;;; go get github.com/rogpeppe/godef
;;; go get -u github.com/nsf/gocode


(add-to-list 'exec-path "/opt/go/bin")
(add-to-list 'exec-path "~/golang/bin")
(add-hook 'go-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'gofmt-before-save)
            (setq-default)
            (setq tab-width 2)
            (setq standard-indent 2)
            (setq indent-tabs-mode nil)
            (auto-complete-mode 1)
            ; Customize compile command to run go build
            (if (not (string-match "go" compile-command))
                (set (make-local-variable 'compile-command)
                     "go build -v && go test -v && go vet"))
            ; Godef jump key binding
            (local-set-key (kbd "M-.") 'godef-jump)
            (local-set-key (kbd "M-*") 'pop-tag-mark)))
(with-eval-after-load 'go-mode
   (require 'go-autocomplete))
