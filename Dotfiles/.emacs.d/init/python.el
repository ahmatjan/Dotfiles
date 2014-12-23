;; python 开发环境配置。
(setq
 python-shell-interpreter "ipython2"
 python-shell-interpreter-args ""
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code
   "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code
   "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code
   "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

(add-to-list 'load-path "~/.emacs.d/packages/python/emacs-deferred")
(load "deferred")
(load "concurrent")

(add-to-list 'load-path "~/.emacs.d/packages/python/emacs-ctable")
(load "ctable")

(add-to-list 'load-path "~/.emacs.d/packages/python/emacs-epc")
(load "epc")

(add-to-list 'load-path "~/.emacs.d/packages/python/emacs-python-environment")
(require 'python-environment)

(add-to-list 'load-path "~/.emacs.d/packages/python/emacs-jedi")
(load "jedi")
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;;使用auto-complete作为jedi的自动补全前端
(require 'auto-complete)
(add-hook 'python-mode-hook 'jedi:ac-setup)
(add-hook 'python-mode-hook '(lambda ()
                               (local-set-key (kbd "RET") 'newline-and-indent)
                               (setq indent-tabs-mode nil)
                               (setq tab-width 4)
                               (setq python-indent 4)
                               (setq python-indent-offset 4)))

;(add-to-list 'load-path "~/.emacs.d/plugin/python/emacs-ipython-notebook/lisp")
;(require 'ein)
;(add-hook 'ein:connect-mode-hook 'ein:jedi-setup)

;;https://github.com/myfreeweb/django-mode
;(add-to-list 'load-path "~/.emacs.d/plugin/python/django-mode/")
;(load "django-html-mode")
;(load "django-mode")
