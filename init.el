;;
;; Pakcage manager
;; ====================

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Bootstrap `use-package`
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


;; Set up load path
(setq user-emacs-home (expand-file-name "~/emacs.d"))
(add-to-list 'load-path user-emacs-home)


;; Settings
(require 'init-basic)
(require 'init-basic-pkgs)
(require 'init-program-pkgs)



