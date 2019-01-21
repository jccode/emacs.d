(require 'use-package)
(require 'func-edit)

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

;; join line
(global-set-key (kbd "C-c j") 'join-line)

(global-set-key (kbd "M-Q") 'unfill-paragraph)


;; Export
(provide 'init-basic)
