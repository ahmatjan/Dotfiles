;;使用的是python.el，python-mode.el不兼容CEDET

(add-to-list 'load-path "~/.emacs.d/plugin/python/python.el")
(load "python")
(setq
 python-shell-interpreter "ipython2"
 Python-shell-interpreter-args ""
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code
   "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code
   "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code
   "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

;;defered、ctable是ebc的依赖文件
(add-to-list 'load-path "~/.emacs.d/plugin/python/emacs-deferred")
(load "deferred")
(load "concurrent")

(add-to-list 'load-path "~/.emacs.d/plugin/python/emacs-ctable")
(load "ctable")

(add-to-list 'load-path "~/.emacs.d/plugin/python/emacs-epc")
(load "epc")

(add-to-list 'load-path "~/.emacs.d/plugin/python/emacs-jedi")
(load "jedi.el")
(jedi:setup)
;;使用auto-complete作为jedi的自动补全前端
(require 'auto-complete)

(add-hook 'python-mode-hook 'jedi:ac-setup)
(add-hook 'python-mode-hook '(lambda ()
                               (setq indent-tabs-mode t)
                               (setq tab-width 4)
                               (setq python-indent-offset 4)))

;;ipython只支持python-mode.el而不是python.el
;(add-to-list 'load-path "~/.emacs.d/plugin/python/ipython/docs/emacs/")
;(setq ipython-command "/usr/bin/ipython2")
;(require 'ipython)

(add-to-list 'load-path "~/.emacs.d/plugin/python/emacs-ipython-notebook/lisp")
(require 'ein)
(add-hook 'ein:connect-mode-hook 'ein:jedi-setup)

;;https://github.com/myfreeweb/django-mode
(add-to-list 'load-path "~/.emacs.d/plugin/python/django-mode/")
(load "django-html-mode")
(load "django-mode")

;;move to yasnippet.el
(add-to-list 'yas-snippet-dirs  "~/.emacs.d/plugin/python/django-mode/snippets")
(add-to-list 'auto-mode-alist '("\\.djhtml$" . django-html-mode))
