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
(global-linum-mode t)
(setq indicate-buffer-boundaries (quote left))

;;在状态栏显示文件大小
(size-indication-mode t)

;禁用启动画面
(setq inhibit-startup-message t)

;;去掉工具栏
(tool-bar-mode 0)

;;去掉菜单栏
;;(menu-bar-mode nil)

;;去掉滚动条
(scroll-bar-mode nil)

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

;;关闭tab功能, 所有的TAB用4个空格代替
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq c-basic-offset 4)

;;简写模式
(setq abbrev-mode t)

;;winner mode
(winner-mode t)

;;文件打开模式
(setq auto-mode-alist
      (append '(("\\.C$"  . c++-mode)
                ("\\.cc$" . c++-mode)
                ("\\.cxx$" . c++-mode)
                ("\\.cpp$" . c++-mode)
                ("\\.h$"  . c++-mode)
                ("\\.H$"  . c++-mode)
                ("\\.hpp$"  . c++-mode)
                ("\\.hh$"  . c++-mode)
                ("\\.c$"  . c-mode)
                ("\\.m$"  . objc-mode)
                ("\\.pm$"  . perl-mode)
                ("\\.rc$" . emacs-lisp-mode)
                ("\\.org$" . org-mode))
              auto-mode-alist))

;;delete trailing space
;;from: http://pedrokroger.com/2010/07/configuring-emacs-as-a-python-ide-2/
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;关闭文件选择窗口
(setq use-file-dialog nil)
(setq use-dialog-box nil)

;;出错时，显示backtrace信息
(setq debug-on-error t)

(ido-mode t)

;;中文字体
;;Refer:http://emacser.com/torture-emacs.htm
;;http://emacser.com/daemon.htm
;;http://stackoverflow.com/questions/3984730/emacs-gui-with-emacs-daemon-not-loading-fonts-correctly
;;http://fanqo.wordpress.com/2011/04/19/emacs-nw-fontset-tty-does-not-exist/
;;http://blog.chmouel.com/2009/08/11/emacs-daemon-and-xdefaults/
(defun frame-setting ()
  (set-frame-font "Monaco-10")
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset
                      (font-spec :family "Microsoft Yahei" :size 12))))

(if (and (fboundp 'daemonp) (daemonp))
    (add-hook 'after-make-frame-functions
	      (lambda (frame)
		(with-selected-frame frame
		  (frame-setting))))
  (frame-setting))
