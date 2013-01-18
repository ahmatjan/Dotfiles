(add-to-list 'load-path "~/.emacs.d/plugin/gnus/lisp")
(load "gnus-util") ;;不加这个的话，gnus启动时提示`void-function gnus-string-prefix-p'
(load "gnus-load")
(add-hook 'gnus-after-getting-new-news-hook 'gnus-notifications)
