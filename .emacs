; Environment
(setq user-full-name "zhangjun3")
(setq user-mail-address "zhangjun3@kingsoft.com")

(setenv "PATH" (concat "~/local/bin:~/golang/bin:/usr/local/bin:/opt/local/bin:/usr/bin:/bin" (getenv "PATH")))
(setenv "GOPATH" (concat (expand-file-name "~/golang") (getenv "GOPATH")))

(require 'cl)

; Package Management
(load "package")
(package-initialize)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(setq package-archive-enable-alist '(("melpa" deft magit)))

; List of default packages
(defvar zhangjun3/packages '(auto-complete
                             exec-path-from-shell
                             expand-region
                             flx-ido
                             flycheck
                             projectile
                             go-mode
                             go-autocomplete ; 需要单独安装godef和gocode程序
                             go-eldoc
                             helm
                             htmlize
                             lua-mode
                             jedi
                             js2-mode
                             json-mode
                             magit
                             markdown-mode
                             org
                             paredit
                             rainbow-delimiters
                             sr-speedbar
                             smartparens
                             smex
                             solarized-theme
                             tabbar
                             zenburn-theme
                             w3m ; 需要单独安装w3m程序
                             web-mode
                             yasnippet
                             yaml-mode
                             )
  "Default packages")

; Install default packages
(defun zhangjun3/packages-installed-p ()
  (loop for pkg in zhangjun3/packages
        when (not (package-installed-p pkg)) do (return nil)
        finally (return t)))

(unless (zhangjun3/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg zhangjun3/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

; Vendor directory
(defvar zhangjun3/vendor-dir (expand-file-name "vendor" user-emacs-directory))
(add-to-list 'load-path zhangjun3/vendor-dir)

(dolist (project (directory-files zhangjun3/vendor-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

; Init
(mapc 'load (directory-files "~/.emacs.d/init" t ".*el$"))
