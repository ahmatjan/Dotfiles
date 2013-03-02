;;=========================================================
;;来自于auto-complete-config.el文件的缺省配置，只用于参考目的。
;;=========================================================
;;; Default settings

; (defun ac-common-setup ()
;   (add-to-list 'ac-sources 'ac-source-filename))

; (defun ac-emacs-lisp-mode-setup ()
;   (setq ac-sources (append '(ac-source-features ac-source-functions
;     ac-source-yasnippet ac-source-variables ac-source-symbols) ac-sources)))

; (defun ac-cc-mode-setup ()
;   (setq ac-sources (append '(ac-source-yasnippet ac-source-gtags) ac-sources)))

; (defun ac-ruby-mode-setup ())

; (defun ac-css-mode-setup ()
;   (setq ac-sources (append '(ac-source-css-property) ac-sources)))

; (defun ac-config-default ()
;   (setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))
;   (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
;   (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
;   (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
;   (add-hook 'css-mode-hook 'ac-css-mode-setup)
;   (add-hook 'auto-complete-mode-hook 'ac-common-setup)
;   (global-auto-complete-mode t))
;;=========================================================

;;popup和fuzzy是auto-complete的依赖package
(add-to-list 'load-path "~/.emacs.d/plugin/auto-complete/lib/popup")
(require 'popup)

(add-to-list 'load-path "~/.emacs.d/plugin/auto-complete/lib/fuzzy")
(require 'fuzzy)

;;auto-complete
(add-to-list 'load-path "~/.emacs.d/plugin/auto-complete")
(set 'ac-dictionary-directories "~/.emacs.d/plugin/auto-complete/dict")
(set 'ac-comphist-file "~/.emacs.d/plugin/auto-complete/comphist.dat")
(setq ac-use-comphist t)

(require 'auto-complete-config)
(ac-config-default)

;全局有效的变量定义，这里添加一些在所有的mode中都启用的source。
(setq-default ac-sources (append  '(ac-source-semantic ;;c/c++代码自动补全
                                    ac-source-imenu ac-source-filename
                                    ac-source-files-in-current-dir)
				  ac-sources))

;;自动打开ac的buff-mode列表，这里增加了缺省没有的org-mode和python-mode.
(setq ac-modes
      (append ac-modes '(org-mode sql-mode text-mode python-mode
                                  makefile-gmake-mode django-mode
				  autoconf-mode makefile-automake-mode)))

;;重新配置候选键到C-p和C-n是为了避免和sementic插件的候选键冲突。
(setq ac-use-menu-map t)
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)
(setq ac-dwim t)
(global-auto-complete-mode t)
