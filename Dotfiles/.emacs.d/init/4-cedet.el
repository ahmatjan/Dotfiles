;;Reference:
;;http://alexott.net/writings/emacs-devenv/EmacsCedet.html
;;https://github.com/alexott/emacs-configs/blob/master/rc/emacs-rc-cedet.el
(add-to-list 'load-path "~/.emacs.d/plugin/bzr/cedet")
(add-to-list 'load-path "~/.emacs.d/plugin/bzr/cedet/contrib")
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
(load "~/.emacs.d/plugin/bzr/cedet/lisp/cedet/cedet-cscope.el")
(load "~/.emacs.d/plugin/bzr/cedet/lisp/cedet/semantic/db-cscope.el")
(load "~/.emacs.d/plugin/bzr/cedet/lisp/cedet/semantic/symref/cscope.el")
(when (cedet-cscope-version-check t)
  (semanticdb-enable-cscope-databases))


;; SRecode
(global-srecode-minor-mode 1)

;; EDE
;;(global-ede-mode 1)
;;(ede-enable-generic-projects)

;; helper for boost setup...
;; (defun recur-list-files (dir re)
;;   "Returns list of files in directory matching to given regex"
;;   (when (file-accessible-directory-p dir)
;;     (let ((files (directory-files dir t))
;;           matched)
;;       (dolist (file files matched)
;;         (let ((fname (file-name-nondirectory file)))
;;           (cond
;;            ((or (string= fname ".")
;;                 (string= fname "..")) nil)
;;            ((and (file-regular-p file)
;;                  (string-match re fname))
;;             (setq matched (cons file matched)))
;;            ((file-directory-p file)
;;             (let ((tfiles (recur-list-files file re)))
;;               (when tfiles (setq matched (append matched tfiles)))))))))))

;; (defun c++-setup-boost (boost-root)
;;   (when (file-accessible-directory-p boost-root)
;;     (let ((cfiles (recur-list-files boost-root "\\(config\\|user\\)\\.hpp")))
;;       (dolist (file cfiles)
;;         (add-to-list 'semantic-lex-c-preprocessor-symbol-file file)))))


;; ;; my functions for EDE
;; (defun alexott/ede-get-local-var (fname var)
;;   "fetch given variable var from :local-variables of project of file fname"
;;   (let* ((current-dir (file-name-directory fname))
;;          (prj (ede-current-project current-dir)))
;;     (when prj
;;       (let* ((ov (oref prj local-variables))
;;             (lst (assoc var ov)))
;;         (when lst
;;           (cdr lst))))))

;; ;; setup compile package
;; (require 'compile)
;; (setq compilation-disable-input nil)
;; (setq compilation-scroll-output t)
;; (setq mode-compile-always-save-buffer-p t)

;; (defun alexott/compile ()
;;   "Saves all unsaved buffers, and runs 'compile'."
;;   (interactive)
;;   (save-some-buffers t)
;;   (let* ((r (alexott/ede-get-local-var
;;              (or (buffer-file-name (current-buffer)) default-directory)
;;              'compile-command))
;;          (cmd (if (functionp r) (funcall r) r)))
;;     (set (make-local-variable 'compile-command) (or cmd compile-command))
;;     (compile compile-command)))

;; (global-set-key [f9] 'alexott/compile)

;; ;;
;; (defun alexott/gen-std-compile-string ()
;;   "Generates compile string for compiling CMake project in debug mode"
;;   (let* ((current-dir (file-name-directory
;;                        (or (buffer-file-name (current-buffer)) default-directory)))
;;          (prj (ede-current-project current-dir))
;;          (root-dir (ede-project-root-directory prj)))
;;     (concat "cd " root-dir "; make -j2")))

;; ;;
;; (defun alexott/gen-cmake-debug-compile-string ()
;;   "Generates compile string for compiling CMake project in debug mode"
;;   (let* ((current-dir (file-name-directory
;;                        (or (buffer-file-name (current-buffer)) default-directory)))
;;          (prj (ede-current-project current-dir))
;;          (root-dir (ede-project-root-directory prj))
;;          (subdir "")
;;          )
;;     (when (string-match root-dir current-dir)
;;       (setf subdir (substring current-dir (match-end 0))))
;;     (concat "cd " root-dir "Debug/" "; make -j3")))

;; (defun alexott/gen-cmake-debug/release-compile-string ()
;;   "Generates compile string for compiling CMake project in debug & release modes"
;;   (let* ((current-dir (file-name-directory
;;                        (or (buffer-file-name (current-buffer)) default-directory)))
;;          (prj (ede-current-project current-dir))
;;          (root-dir (ede-project-root-directory prj))
;;          (subdir "")
;;          )
;;     (when (string-match root-dir current-dir)
;;       (setf subdir (substring current-dir (match-end 0))))
;;     (concat "cd " root-dir "Debug/ && make -j3 && cd " root-dir "Release/ && make -j3" )))

;; ;; Projects

;; ;; cpp-tests project definition
;; (when (file-exists-p "~/projects/lang-exp/cpp/CMakeLists.txt")
;;   (setq cpp-tests-project
;; (ede-cpp-root-project "cpp-tests"
;; :file "~/projects/lang-exp/cpp/CMakeLists.txt"
;; :system-include-path '("/home/ott/exp/include"
;; boost-base-directory)
;; :local-variables (list
;; (cons 'compile-command 'alexott/gen-cmake-debug-compile-string)
;; )
;; )))

;; (when (file-exists-p "~/projects/squid-gsb/README")
;;   (setq squid-gsb-project
;; (ede-cpp-root-project "squid-gsb"
;; :file "~/projects/squid-gsb/README"
;; :system-include-path '("/home/ott/exp/include"
;; boost-base-directory)
;; :local-variables (list
;; (cons 'compile-command 'alexott/gen-cmake-debug-compile-string)
;; )
;; )))

;; ;; (when (file-exists-p "~/work/emacs-head/README")
;; ;; (setq emacs-project
;; ;; (ede-emacs-project "emacs-head"
;; ;; :file "~/work/emacs-head/README")))


;; ;; (setq arabica-project
;; ;; (ede-cpp-root-project "arabica"
;; ;; :file "~/projects/arabica-devel/README"
;; ;; :system-include-path '("/home/ott/exp/include"
;; ;; boost-base-directory)
;; ;; :local-variables (list
;; ;; (cons 'compile-command 'alexott/gen-std-compile-string)
;; ;; )
;; ;; ))

;;使用CEDET和autocomplete对Qt代码进行补全
;;from http://www.emacswiki.org/cgi-bin/wiki/QtMode
;; syntax-highlighting for Qt
;; (based on work by Arndt Gulbrandsen, Troll Tech)
;;make sure sematic has already loaded.

(setq qt4-base-directory "/usr/include/Qt")
(setq qt4-QtCore-dir  "/usr/include/QtCore")
(setq qt4-QtGui-dir   "/usr/include/QtGui")
(setq qt4-QtHelp-dir  "/usr/include/QtHelp")
(setq qt4-QtMultimedia-dir "/usr/include/QtMultimedia")
(setq qt4-QtNetWork-dir  "/usr/include/QtNetwork")
(setq qt4-QtSql-dir  "/usr/include/QtSql")
(setq qt4-QtSvg-dir  "/usr/include/QtSvg")
(setq qt4-QtXml-dir "/usr/include/QtXml")
(setq qt4-QtWebKit-dir  "/usr/include/QtWebKit")
(setq qt4-QtDesigner-dir "/usr/include/QtDesigner")

(semantic-add-system-include qt4-base-directory 'c++-mode)
(add-to-list 'auto-mode-alist (cons qt4-base-directory 'c++-mode))
(semantic-add-system-include qt4-QtGui-dir 'c++-mode)
(semantic-add-system-include qt4-QtCore-dir 'c++-mode)
(semantic-add-system-include qt4-QtNetWork-dir 'c++-mode)
(semantic-add-system-include qt4-QtSql-dir 'c++-mode)
(semantic-add-system-include qt4-QtXml-dir 'c++-mode)
(semantic-add-system-include qt4-QtHelp-dir 'c++-mode)
(semantic-add-system-include qt4-QtMultimedia-dir 'c++-mode)
(semantic-add-system-include qt4-QtSvg-dir 'c++-mode)
(semantic-add-system-include qt4-QtWebKit-dir 'c++-mode)
(semantic-add-system-include qt4-QtDesigner-dir 'c++-mode)

(add-to-list 'semantic-lex-c-preprocessor-symbol-file  "/usr/include/Qt/qwebkitglobal.h")
(add-to-list 'semantic-lex-c-preprocessor-symbol-file  "/usr/include/Qt/qobjectdefs.h")
(add-to-list 'semantic-lex-c-preprocessor-symbol-file  "/usr/include/Qt/qconfig-nacl.h")
(add-to-list 'semantic-lex-c-preprocessor-symbol-file  "/usr/include/Qt/qconfig-large.h")
(add-to-list 'semantic-lex-c-preprocessor-symbol-file  "/usr/include/Qt/qconfig-medium.h")
(add-to-list 'semantic-lex-c-preprocessor-symbol-file  "/usr/include/Qt/qconfig-minimal.h")
(add-to-list 'semantic-lex-c-preprocessor-symbol-file  "/usr/include/Qt/qconfig-small.h")
(add-to-list 'semantic-lex-c-preprocessor-symbol-file  "/usr/include/Qt/qglobal.h")
(add-to-list 'semantic-lex-c-preprocessor-symbol-file  "/usr/include/Qt/qconfig-dist.h")
(add-to-list 'semantic-lex-c-preprocessor-symbol-file  "/usr/include/Qt/qconfig.h")
(semantic-c-reset-preprocessor-symbol-map) ;;不可少，否则上面添加的symbol-file将不会被解析。

;;使semantic高亮Qt的关键字
(defun jk/c-mode-common-hook ()
  "Set up c-mode and related modes.
 Includes support for Qt code (signal, slots and alikes)."

  ;; qt keywords and stuff ...
  ;; set up indenting correctly for new qt kewords
  (setq c-protection-key (concat "\\<\\(public\\|public slot\\|protected"
                                 "\\|protected slot\\|private\\|private slot"
                                 "\\)\\>")
        c-C++-access-key (concat "\\<\\(signals\\|public\\|protected\\|private"
                                 "\\|public slots\\|protected slots\\|private slots"
                                 "\\)\\>[ \t]*:"))
  (progn
    ;; modify the colour of slots to match public, private, etc ...
    (font-lock-add-keywords 'c++-mode
                            '(("\\<\\(slots\\|signals\\)\\>" . font-lock-type-face)))
    ;; make new font for rest of qt keywords
    (make-face 'qt-keywords-face)
    (set-face-foreground 'qt-keywords-face "BlueViolet")
    ;; qt keywords
    (font-lock-add-keywords 'c++-mode
                            '(("\\<Q_OBJECT\\>" . 'qt-keywords-face)))
    (font-lock-add-keywords 'c++-mode
                            '(("\\<SIGNAL\\|SLOT\\>" . 'qt-keywords-face)))
    (font-lock-add-keywords 'c++-mode
                            '(("\\<Q[A-Z][A-Za-z]*" . 'qt-keywords-face)))
    ))
(add-hook 'c-mode-common-hook 'jk/c-mode-common-hook)

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
                              "/usr/include/c++/4.7.2" ;;注意函数库版本变化
                              "/usr/include/c++/4.7.2/i686-pc-linux-gnu" ;;注意体系结构变化
                              "/usr/include/c++/4.7.2/backward"
                              "/usr/lib/gcc/i686-pc-linux-gnu/4.7.2/include"
                              "/usr/lib/gcc/i686-pc-linux-gnu/4.7.2/include-fixed"
                              "/usr/local/include"
                              ))

(let ((include-dirs cedet-user-include-dirs))
  (setq include-dirs (append include-dirs cedet-sys-include-dirs))
  (mapc (lambda (dir)
          (semantic-add-system-include dir 'c-mode)
          (semantic-add-system-include dir 'c++-mode))
        include-dirs))
