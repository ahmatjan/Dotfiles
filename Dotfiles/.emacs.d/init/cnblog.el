(add-to-list 'load-path "~/.emacs.d/plugin/cnblogs")
(require 'cnblogs)
(add-hook 'org-mode-hook (lambda ()
                             (cnblogs-minor-mode)))
