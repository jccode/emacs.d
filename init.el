;; 
;; Normal settings
;; ====================

(setq inhibit-startup-message t)

(tool-bar-mode -1)

(delete-selection-mode 1)

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(icomplete-mode 1)


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


;;
;; Packages
;; ====================

(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))


;;
;; Others
;; ====================


