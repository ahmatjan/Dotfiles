;;for backward-word delete
(define-key global-map (kbd "C-h") 'delete-backward-char)
(define-key global-map (kbd "M-h") 'backward-kill-word)

;;关闭C-SPC命令, 因它与ibus激活键冲突
(global-unset-key (kbd "C-SPC"))
