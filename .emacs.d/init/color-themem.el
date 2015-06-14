(add-to-list 'load-path "~/.emacs.d/plugin/color-theme")
(add-to-list 'load-path "~/.emacs.d/plugin/color-theme/themes")
(add-to-list 'load-path "~/.emacs.d/plugin/color-theme-molokai")
(add-to-list 'custom-theme-load-path "~/.emacs.d/plugin/molokai-theme")
(require 'color-theme)
(load "color-theme-library.el")

(color-theme-initialize)
;(color-theme-clarity)
;(color-theme-classic)
(load "color-theme-molokai.el")
(color-theme-molokai)
;(setq molokai-theme-kit t) ;; set molokai's mode line style;
;(load-theme 'molokai t) ;; Load them without prompting to confirm;
