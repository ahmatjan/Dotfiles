(add-to-list 'load-path "~/.emacs.d/plugin/smarttabs")
(load "smart-tabs-mode")

;; Load all the following in one pass
(smart-tabs-insinuate 'c 'javascript 'cperl 'python 'ruby)

;;smarttabs需要启用ident-tabs-mode
