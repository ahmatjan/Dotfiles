(require 'go-mode-autoloads)

(defun my-go-mode-hook ()
  (add-hook 'before-save-hook 'gofmt-before-save)
  (local-set-key (kbd "C-c C-a") 'go-import-add)
  (local-set-key (kbd "C-c i") 'go-goto-imports)
  (local-set-key (kbd "C-c C-f") 'gofmt)
  (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)
  (local-set-key (kbd "M-.") 'godef-jump))
(add-hook 'go-mode-hook 'my-go-mode-hook)

;; jump into code with M-. and jump back with M-*
;; go-autocomplete依赖godef和gocode程序，可以用下面的命令先安装
;; go get github.com/nsf/gocode
;; go get github.com/rogpeppe/godef
(shell-command "go get github.com/nsf/gocode")
(shell-command "go get github.com/rogpeppe/godef")
(require 'go-autocomplete)
(require 'auto-complete-config)

(require 'go-eldoc)
(add-hook 'go-mode-hook 'go-eldoc-setup)
