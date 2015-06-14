(add-to-list 'load-path "~/.emacs.d/packages/gnus/lisp")
(load "gnus-util") ;;不加这个的话，gnus启动时提示`void-function gnus-string-prefix-p'
(require 'gnus-load)
(add-hook 'gnus-after-getting-new-news-hook 'gnus-notifications)

;; Desktop notification intergation in Gnus;
;; Need 'gnus-desktop-notify' and libnotify-bin package which provides notify-send program
(add-to-list 'load-path "~/.emacs.d/packages/gnus-desktop-notify")
(require 'gnus-desktop-notify)
(gnus-desktop-notify-mode)
(gnus-demon-add-scanmail)

(add-to-list 'load-path "~/.emacs.d/packages/alert")
(require 'alert)
