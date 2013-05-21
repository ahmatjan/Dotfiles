;;自动备份配置
(setq make-backup-files t)
(setq version-control t)
(setq kept-old-versions 2)
(setq kept-new-versions 5)
(setq delete-old-versions t)
;;所有备份文件都放到cache目录中
(setq backup-directory-alist '(("" . "~/.emacs.d/cache/backup-files")))
