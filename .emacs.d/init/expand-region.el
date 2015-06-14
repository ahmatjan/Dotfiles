(add-to-list 'load-path "~/.emacs.d/packages/expand-region.el")
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
