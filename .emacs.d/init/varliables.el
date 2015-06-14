;;缺省模式
(setq-default default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;;句号后跟两个空格
(setq colon-double-space t)

;; eliminate long "yes" or "no" prompts
(fset 'yes-or-no-p 'y-or-n-p)

;;在状态栏显示列号
(column-number-mode t)

;;在状态栏显示时间
(display-time-mode t)

;;在左侧显示行号
(global-linum-mode 0)
(setq indicate-buffer-boundaries (quote left))

;;在状态栏显示文件大小
(size-indication-mode t)

;禁用启动画面
(setq inhibit-startup-message t)

;;去掉工具栏
(tool-bar-mode nil)

;;去掉滚动条
(menu-bar-no-scroll-bar)

;;去掉菜单栏
(menu-bar-mode nil)

;;设定行距
(setq default-line-spacing 1)

;;页宽
(setq default-fill-column 80)

;;语法加亮
(global-font-lock-mode t)

;;高亮显示区域选择
(transient-mark-mode t)

;;页面平滑滚动
(setq scroll-margin 3 scroll-conservatively 10000)

;;高亮显示成对括号，但不来回弹跳
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;;鼠标指针规避光标
(mouse-avoidance-mode 'animate)

;;光标显示为一竖线
;;(setq-default cursor-type 'bar)

;;透明
(set-frame-parameter (selected-frame) 'alpha '(80 70))
(add-to-list 'default-frame-alist '(alpha 95 85))

;;在标题栏提示目前我的位置
(setq frame-title-format "zym@%b")

;;标题栏显示%f缓冲区完整路径%p页面百分数%l行号
(setq frame-title-format "%f")

;;使用X剪贴板
(setq x-select-enable-clipboard t)

;;打开图片显示功能
(auto-image-file-mode t)

;;打开自动缩进模式
(auto-fill-mode t)

;;tab
;; set default tab char's display width to 4 spaces
(setq-default tab-width 4) ; emacs 23.1, 24.2, default to 8
;; make indentation commands use space only (never tab character)
(setq-default indent-tabs-mode nil) ; emacs 23.1, 24.2, default to t

;;简写模式
(setq abbrev-mode t)

;;winner mode
(winner-mode t)

;;delete trailing space
;;from: http://pedrokroger.com/2010/07/configuring-emacs-as-a-python-ide-2/
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;关闭文件选择窗口
(setq use-file-dialog nil)
(setq use-dialog-box nil)

;;出错时，显示backtrace信息
(setq debug-on-error t)

;;当从mutt中调用emacs时，进入mail mode
;; mutt support
(setq auto-mode-alist (append '(("/tmp/mutt.*" . mail-mode)) auto-mode-alist))

;; tramp
(require 'tramp)
(setq tramp-default-method "ssh")
(setq tramp-verbose 10)

;;for dired
(setq dired-recursive-deletes t) ; 可以递归的删除目录
(setq dired-recursive-copies t) ; 可以递归的进行拷贝
;;thumbs
(autoload 'thumbs "thumbs" "Preview images in a directory." t)
;;允许在dired中直接使用a命令进入当前目录
(put 'dired-find-alternate-file 'disabled nil)

;; 窗口左侧显示进度提示标识
(setq-default indicate-empty-lines t)
(when (not indicate-empty-lines)
  (toggle-indicate-empty-lines))

;; 设置字体
(set-frame-font "Source Code Pro-14" nil t)
