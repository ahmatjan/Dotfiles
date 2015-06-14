;; * Keybindings from xcscope.el
;;
;; All keybindings use the "C-c s" prefix, but are usable only while
;; editing a source file, or in the cscope results buffer:
;;
;;      C-c s s         Find symbol.
;;      C-c s d         Find global definition.
;;      C-c s g         Find global definition (alternate binding).
;;      C-c s G         Find global definition without prompting.
;;      C-c s c         Find functions calling a function.
;;      C-c s C         Find called functions (list functions called
;;                      from a function).
;;      C-c s t         Find text string.
;;      C-c s e         Find egrep pattern.
;;      C-c s f         Find a file.
;;      C-c s i         Find files #including a file.
;;
;; These pertain to navigation through the search results:
;;
;;      C-c s b         Display *cscope* buffer.
;;      C-c s B         Auto display *cscope* buffer toggle.
;;      C-c s n         Next symbol.
;;      C-c s N         Next file.
;;      C-c s p         Previous symbol.
;;      C-c s P         Previous file.
;;      C-c s u         Pop mark.
;;
;; These pertain to setting and unsetting the variable,
;; `cscope-initial-directory', (location searched for the cscope database
;;  directory):
;;
;;      C-c s a         Set initial directory.
;;      C-c s A         Unset initial directory.
;;
;; These pertain to cscope database maintenance:
;;
;;      C-c s L         Create list of files to index.
;;      C-c s I         Create list and index.
;;      C-c s E         Edit list of files to index.
;;      C-c s W         Locate this buffer's cscope directory
;;                      ("W" --> "where").
;;      C-c s S         Locate this buffer's cscope directory.
;;                      (alternate binding: "S" --> "show").
;;      C-c s T         Locate this buffer's cscope directory.
;;                      (alternate binding: "T" --> "tell").
;;      C-c s D         Dired this buffer's directory.
(add-to-list 'load-path "~/.emacs.d/packages/xcscope.el")
(setq cscope-program "gtags-cscope")
(require 'xcscope)
(cscope-setup)

(add-to-list 'load-path "~/.emacs.d/packages/pycscope/contrib/xpycscope/")
(require 'xpycscope)

(define-key global-map [(control f3)]  'pycscope-set-initial-directory)
(define-key global-map [(control f4)]  'pycscope-unset-initial-directory)
(define-key global-map [(control f5)]  'pycscope-find-this-symbol)
(define-key global-map [(control f6)]  'pycscope-find-global-definition)
(define-key global-map [(control f7)]
	'pycscope-find-global-definition-no-prompting)
(define-key global-map [(control f8)]  'pycscope-pop-mark)
(define-key global-map [(control f9)]  'pycscope-next-symbol)
(define-key global-map [(control f10)] 'pycscope-next-file)
(define-key global-map [(control f11)] 'pycscope-prev-symbol)
(define-key global-map [(control f12)] 'pycscope-prev-file)
(define-key global-map [(meta f9)]  'pycscope-display-buffer)
(define-key global-map [(meta f10)] 'pycscope-display-buffer-toggle)
