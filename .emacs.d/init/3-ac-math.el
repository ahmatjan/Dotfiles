;;;After auto-complete
;;利用autocomplete对latex模式自动补全。
;;Reference: http://code.google.com/p/ac-math/
(add-to-list 'load-path "~/.emacs.d/plugin/ac-math")

(require 'ac-math)
(add-to-list 'ac-modes 'latex-mode)   ; make auto-complete aware of {{{latex-mode}}}

(defun ac-latex-mode-setup ()         ; add ac-sources to default ac-sources
  (setq ac-sources
     (append '(ac-source-math-unicode ac-source-math-latex ac-source-latex-commands)
               ac-sources))
)

(add-hook 'LaTeX-mode-hook 'ac-latex-mode-setup)
(setq ac-math-unicode-in-math-p t)
