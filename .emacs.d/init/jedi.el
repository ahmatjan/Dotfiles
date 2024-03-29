(setq
 python-shell-interpreter "ipython2"
 python-shell-interpreter-args ""
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code  "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code "';'.join(get_ipython().Completer.all_completions('''%s'''))\n"
 )

(require 'jedi)
(add-hook 'python-mode-hook '(lambda ()
                               (jedi:install-server)
                               (jedi:setup)
                               (jedi-mode t)
                               (setq jedi:complete-on-dot t)
                               ;;使用auto-complete作为jedi的自动补全前端
                               (require 'auto-complete)
                               (jedi:ac-setup)
                               (local-set-key (kbd "RET") 'newline-and-indent)
                               (setq indent-tabs-mode nil)
                               (setq tab-width 4)
                               (setq python-indent 4)
                               (setq python-indent-offset 4)
                               ))
