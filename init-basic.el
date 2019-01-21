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

;; disable auto backup
(setq make-backup-files nil)

;; set frame title
(setq frame-title-format "%b - Emacs")


;;
;; Custom functions
;; ====================

;; duplicate line
(global-set-key "\C-cd" "\C-a\C- \C-e\M-w\C-n\C-y")




;; Export
(provide 'init-basic)
