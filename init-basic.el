(require 'use-package)

;; 
;; Basic settings
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

(electric-pair-mode 1)


;; 
;; Themes
;; ====================

;; (use-package monokai-theme
;;   :ensure t
;;   :config (load-theme 'monokai t))

(use-package doom-themes
  :ensure t
  :config (load-theme 'doom-molokai t))


;; Install the fonts by call:  M-x all-the-icons-install-fonts
(use-package all-the-icons
  :ensure t)

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-init))


;;
;; Custom functions
;; ====================

;; duplicate line
(global-set-key "\C-cd" "\C-a\C- \C-e\M-w\C-n\C-y")



;; Export

(provide 'init-basic)
