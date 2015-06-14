;;Reference:
;;http://alexott.net/writings/emacs-devenv/EmacsCedet.html
;;https://github.com/alexott/emacs-configs/blob/master/rc/emacs-rc-cedet.el
(add-to-list 'load-path "~/.emacs.d/packages/cedet")
(add-to-list 'load-path "~/.emacs.d/packages/cedet/contrib")
(load "cedet-devel-load")

(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-mru-bookmark-mode)

(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
(add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-highlight-func-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-decoration-mode)

(add-to-list 'semantic-default-submodes 'global-semantic-idle-local-symbol-highlight-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-completions-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)

(add-to-list 'semantic-default-submodes 'global-semanticdb-idle-completions-mode)
(add-to-list 'semantic-default-submodes 'global-semanticdb-idle-summary-mode)

;;;other sub-modes userfel for developing adn debuging CEDET
;;(add-to-list 'semantic-default-submodes 'global-semantic-show-unmatched-syntax-mode)
;;(add-to-list 'semantic-default-submodes 'global-semantic-highlight-edits-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-show-parser-state-mode)

;; Activate semantic
(semantic-mode 1)

(require 'semantic/bovine/c)
(require 'semantic/bovine/clang)
(require 'semantic/bovine/gcc)
(require 'semantic/ia)
(require 'semantic/decorate/include)
(require 'semantic/lex-spp)

;; loading contrib...
(require 'eassist)

;; customisation of modes
(defun alexott/cedet-hook ()
  (local-set-key [(control return)] 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol)

  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-c=" 'semantic-decoration-include-visit)

  (local-set-key "\C-cj" 'semantic-ia-fast-jump)
  (local-set-key "\C-cq" 'semantic-ia-show-doc)
  (local-set-key "\C-cs" 'semantic-ia-show-summary)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)
  (add-to-list 'ac-sources 'ac-source-semantic)
  )

(add-hook 'c-mode-common-hook 'alexott/cedet-hook)
(add-hook 'lisp-mode-hook 'alexott/cedet-hook)
(add-hook 'scheme-mode-hook 'alexott/cedet-hook)
(add-hook 'emacs-lisp-mode-hook 'alexott/cedet-hook)
(add-hook 'erlang-mode-hook 'alexott/cedet-hook)

(defun alexott/c-mode-cedet-hook ()
  (local-set-key "\C-ct" 'eassist-switch-h-cpp)
  (local-set-key "\C-xt" 'eassist-switch-h-cpp)
  (local-set-key "\C-ce" 'eassist-list-methods)
  (local-set-key "\C-c\C-r" 'semantic-symref)

  (add-to-list 'ac-sources 'ac-source-gtags)
)

(add-hook 'c-mode-common-hook 'alexott/c-mode-cedet-hook)

;; support for gnu global
(when (cedet-gnu-global-version-check t)
  (semanticdb-enable-gnu-global-databases 'c-mode t)
  (semanticdb-enable-gnu-global-databases 'c++-mode t))

;; enable ctags for some language:
;; shell, perl, pascal, tcl, fortran, asm
(when (cedet-ectag-version-check t)
  (semantic-load-enable-primary-ectags-support))

(defun my-semanticdb-hook ()
  (imenu-add-to-menubar "TAGS")
  )
(add-hook 'semantic-init-hook 'my-semanticdb-hook)
(setq semanticdb-default-save-directory "~/.emacs.d/cache/semanticdb")
;;add cscope backend support for semanticdb
(load "~/.emacs.d/packages/cedet/lisp/cedet/cedet-cscope.el")
(load "~/.emacs.d/packages/cedet/lisp/cedet/semantic/db-cscope.el")
(load "~/.emacs.d/packages/cedet/lisp/cedet/semantic/symref/cscope.el")
(when (cedet-cscope-version-check t)
  (semanticdb-enable-cscope-databases))


;; SRecode
(global-srecode-minor-mode 1)

;; EDE
;(global-ede-mode 1)
;(ede-enable-generic-projects)

;;special include dir
(defconst cedet-user-include-dirs
  (list "."
        ".."
        "../include"
        "../inc"
        "../common"
        "../public"
        "../.."
        "../../include"
        "../../inc"
        "../../common"
        "../../public"
))
(setq cedet-sys-include-dirs (list
                              "/usr/include"
                              "/usr/include/bits"
                              "/usr/include/linux"
                              "/usr/include/asm"
                              "/usr/include/glib-2.0"
                              "/usr/include/gnu"
                              "/usr/include/c++/4.8.0" ;;注意函数库版本变化
                              "/usr/include/c++/4.8.0/x86_64-unknown-linux-gnu" ;;注意体系结构变化
                              "/usr/include/c++/4.8.0/backward"
                              "/usr/lib/gcc/x86_64-unknown-linux-gnu/4.8.0/include"
                              "/usr/lib/gcc/x86_64-unknown-linux-gnu/4.8.0/include-fixed"
                              "/usr/local/include"
                              ))

(let ((include-dirs cedet-user-include-dirs))
  (setq include-dirs (append include-dirs cedet-sys-include-dirs))
  (mapc (lambda (dir)
          (semantic-add-system-include dir 'c-mode)
          (semantic-add-system-include dir 'c++-mode))
        include-dirs))

;; cl-lib
(add-to-list 'load-path "~/.emacs.d/packages/cl-lib")
(eval-when-compile (require 'cl))

;; ecb
(setq ecb-version-check nil)
(add-to-list 'load-path "~/.emacs.d/packages/ecb")
(require 'ecb)
