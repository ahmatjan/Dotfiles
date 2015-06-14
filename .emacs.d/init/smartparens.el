;;dash.el
(add-to-list 'load-path "~/.emacs.d/packages/dash.el")

;;smartparens
(add-to-list 'load-path "~/.emacs.d/packages/smartparens")
(require 'smartparens-config)
(smartparens-global-mode 1)
(show-smartparens-global-mode t)
