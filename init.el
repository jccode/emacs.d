;;
;; Pakcage manager
;; ====================

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("elpa" . "https://elpa.gnu.org/packages/"))
(package-initialize)

;; Bootstrap `use-package`
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


;; Set up load path
(setq emacs-home (expand-file-name "~/emacs")) ;
(add-to-list 'load-path emacs-home)


;; Common setup
(require 'setup-common)


;; Settings
(require 'init-basic)
(require 'init-theme)
(require 'init-edit-pkgs)
(require 'init-program-pkgs)
(require 'init-org)
(require 'init-misc)


;; Emacs server
;; (require 'server)
;; (unless (server-running-p)
;;   (server-start))



;; load all custom scripts
(setq custom-dir (expand-file-name "user-customs" emacs-home))
(when (file-exists-p custom-dir)
  (mapc 'load (directory-files custom-dir t "^[^#].*el$")))
