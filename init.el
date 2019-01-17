;; 
;; Normal settings
;; ====================

;; No splash screen
(setq inhibit-startup-message t)

;; Hide toolbar
(tool-bar-mode -1)

;; Replace characters at place
(delete-selection-mode 1)

;; Turn on ido-mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; Turn icomplete-mode
(icomplete-mode 1)

;; Highline parentheses match
(show-paren-mode 1)



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

(use-package auto-complete
  :ensure t
  :config
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    ))

(use-package ace-jump-mode
  :ensure t
  :bind (("C-c SPC" . 'ace-jump-mode)
	 ("M-g f" . 'ace-jump-line-mode)
	 ))

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

(use-package multiple-cursors
  :ensure t
  :bind (("C-S-c C-S-c" . 'mc/edit-lines)
	 ("C->" . 'mc/mark-next-like-this)
	 ("C-<" . 'mc/mark-previous-like-this)
	 ("C-c C-<" . 'mc/mark-all-like-this)
	 ))

(use-package expand-region
  :ensure t
  :bind ("C-=" . 'er/expand-region))

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

(use-package smex
  :ensure t
  :bind (("M-x" . 'smex)
	 ("M-X" . 'smex-major-mode-commands)
	 ;; This is the old M-x
	 ("C-c C-c M-x" . 'execute-extended-command)))



;;
;; Others
;; ====================


