;;for dired
(setq dired-recursive-deletes t) ; 可以递归的删除目录
(setq dired-recursive-copies t) ; 可以递归的进行拷贝
;;thumbs
(autoload 'thumbs "thumbs" "Preview images in a directory." t)
;;允许在dired中直接使用a命令进入当前目录
(put 'dired-find-alternate-file 'disabled nil)
