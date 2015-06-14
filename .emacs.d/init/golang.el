(add-to-list 'load-path "~/.emacs.d/packages/go-mode")
(require 'go-mode-autoloads)
(add-hook 'go-mode-hook '(lambda ()
                           (local-set-key (kbd "C-c C-f") 'gofmt)))
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook (lambda () (local-set-key (kbd "C-c i") 'go-goto-imports)))
(add-hook 'go-mode-hook '(lambda ()
                           (local-set-key (kbd "C-c C-f") 'gofmt)))
(defun my-go-mode-hook ()
  ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump))
(add-hook 'go-mode-hook 'my-go-mode-hook)
;; jump into code with M-. and jump back with M-*

(add-to-list 'load-path "~/.emacs.d/packages/gocode")
(require 'go-autocomplete)
(require 'auto-complete-config)

(add-to-list 'load-path "~/.emacs.d/packages/emacs-go-eldoc")
(require 'go-eldoc)
(add-hook 'go-mode-hook 'go-eldoc-setup)
