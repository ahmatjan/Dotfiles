(add-to-list 'load-path "~/.emacs.d/packages/projectile")
(require 'projectile)
(projectile-global-mode)
;If you want Projectile to be usable in every directory (even without the presence of project file):
(setq projectile-require-project-root nil)
