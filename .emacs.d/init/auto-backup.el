(setq make-backup-files t)
(setq version-control t)
(setq kept-old-versions 2)
(setq kept-new-versions 5)
(setq delete-old-versions t)

(shell-command "mkdir -p ~/.emacs.d/auto-backup")
(setq backup-directory-alist '(("" . "~/.emacs.d/auto-backup")))
