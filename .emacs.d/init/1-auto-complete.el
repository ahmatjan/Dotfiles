;;popup-el
(add-to-list 'load-path "~/.emacs.d/packages/popup-el")
(require 'popup)

;;fuzzy-el
(add-to-list 'load-path "~/.emacs.d/packages/fuzzy-el")
(require 'fuzzy)

;;auto-complete
(add-to-list 'load-path "~/.emacs.d/packages/auto-complete")
(set 'ac-dictionary-directories "~/.emacs.d/cache/ac-dict")
(set 'ac-comphist-file "~/.emacs.d/cache/ac-comphist.dat")
(set 'ac-use-comphist t)
(require 'auto-complete-config)
(ac-config-default)


;;添加'ac-config-defaut'没有启用的source, 全局生效。
(setq-default ac-sources
              (append
               '(ac-source-semantic ;c/c++代码自动补全
                 ac-source-imenu ac-source-filename
                 ac-source-files-in-current-dir)
               ac-sources))

;;自动打开ac模式的buff-mode列表，增加缺省没有启用的mode。
(setq ac-modes
      (append ac-modes '(org-mode sql-mode text-mode django-mode)))

;;重新配置候选键到C-p和C-n， 避免和sementic插件的候选键冲突。
(setq ac-use-menu-map t)
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)
(setq ac-dwim t) ;Do-What-I-Mean

;;利用autocomplete对latex模式自动补全。
;;Reference: http://code.google.com/p/ac-math/
(add-to-list 'load-path "~/.emacs.d/packages/ac-math")
(require 'ac-math)
(add-to-list 'ac-modes 'latex-mode)   ; make auto-complete aware of {{{latex-mode}}}

(defun ac-latex-mode-setup ()         ; add ac-sources to default ac-sources
  (setq ac-sources
     (append '(ac-source-math-unicode ac-source-math-latex ac-source-latex-commands)
               ac-sources))
)

(add-hook 'LaTeX-mode-hook 'ac-latex-mode-setup)
(setq ac-math-unicode-in-math-p t)
