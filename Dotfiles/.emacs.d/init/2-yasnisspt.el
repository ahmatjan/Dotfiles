;;website: https://github.com/capitaomorte/yasnippet
(add-to-list 'load-path
	     "~/.emacs.d/plugin/yasnippet")
(require 'yasnippet)

;;;use yas-minor-mode on a per-buffer basis
;replace (yas-global-mode 1) with (yas-reload-all)
;then add a call to (yas-minor-mode) to the major-modes
;where you to enable YASnippet, for example
;(add-hook 'prog-mode-hook
;	   '(lambda ()
;	   (yas-minor-mode)))

;;;Add snippets to yasnippet by add its directory to
; `yas-snippet-dirs', for example
(setq  yas-snippet-dirs
       '("~/.emacs.d/snippets" ;;persional snippets
         "~/.emacs.d/plugin/yasnippet/snippets" ;;the default collection
         "~/.emacs.d/plugin/python/django-mode/snippets" ;;django-mode
       ))

(yas-global-mode 1) ;;or M-x yas-reload-all if you've started YASnippet already
