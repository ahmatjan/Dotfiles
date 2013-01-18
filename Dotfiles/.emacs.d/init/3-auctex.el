;;Reference: http://emacser.com/auctex.htm
;;http://www.emacswiki.org/emacs/AUCTeX

(add-to-list 'load-path "~/.emacs.d/plugin/cvs/auctex")
(add-to-list 'load-path "~/.emacs.d/plugin/cvs/auctex/preview")

;;不能为(require 'auctex),因为auctex.el中没有提供(provide 'auctex)语句
(load "auctex")
(load "preview-latex")

(setq TeX-auto-save t)
(setq TeX-parse-self t)

;;多文件include时的总文件
;(setq-default TeX-master nil)

(add-hook 'LaTeX-mode-hook 'visual-line-mode)
;;reftex是emacs内置的插件, 可以按目录结构浏览文件。
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(add-hook 'LaTeX-mode-hook 'auto-fill-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
;(add-hook 'LaTeX-mode-hook 'flyspell-mode)

(setq reftex-plug-into-AUCTeX t)

;;使用xetex引擎作为tex源文件的编译器。
(add-hook 'LaTeX-mode-hook
          (lambda ()
            (setq TeX-auto-untabify t     ; remove all tabs before saving
                  TeX-engine 'xetex       ; use xelatex default
                  TeX-show-compilation t) ; display compilation windows
            (TeX-global-PDF-mode t)       ; PDF mode enable, not plain
            (setq TeX-save-query nil)
            (imenu-add-menubar-index)
            (define-key LaTeX-mode-map (kbd "TAB") 'TeX-complete-symbol)))

;;pdf阅读器程序列表
(setq TeX-view-program-list
      '(("Zathura" "zathura %o")
        ("Foxitreader" "foxitreader %o")
        ("Evince" "evince %o")
        ))

;;根据系统类型自动选择查看pdf文档的程序。
(cond
 ((eq system-type 'windows-nt)
  (add-hook 'LaTeX-mode-hook
            (lambda ()
              (setq TeX-view-program-selection '((output-pdf "SumatraPDF")
                                                 (output-dvi "Yap"))))))
 ((eq system-type 'gnu/linux)
  (add-hook 'LaTeX-mode-hook
           (lambda ()
             (setq TeX-view-program-selection '((output-pdf "Evince")
                                                (output-dvi "Evince")))))))
