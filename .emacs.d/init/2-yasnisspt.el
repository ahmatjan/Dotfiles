;;website: https://github.com/capitaomorte/yasnippet
(add-to-list 'load-path "~/.emacs.d/packages/yasnippet")
(require 'yasnippet)

;;;Add snippets to yasnippet by add its directory to
; `yas-snippet-dirs', for example
(setq  yas-snippet-dirs
       '("~/.emacs.d/snippets" ;;persional snippets
         "~/.emacs.d/packages/yasnippet/snippets" ;;the default collection
       ))

(yas-global-mode 1) ;;or M-x yas-reload-all if you've started YASnippet already
