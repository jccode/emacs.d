(require 'use-package)
(require 'func-edit)

;; 
;; Basic settings
;; ====================

;; Default settings
(setq inhibit-startup-message t  ; No splash screen
      fill-column 120		 ; Width for line breaks
      tab-width 4
      )

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

;; Highlight current line
(global-hl-line-mode)

;; Default to utf-8 encoding
(set-default-coding-systems 'utf-8)


;; 
;; Soft wrapping in emacs
;; 
(setq-default fill-column 120)

(global-visual-line-mode t)

;; turn on visual-fill-column-mode when visual-line-mode active.
(add-hook 'visual-line-mode-hook #'visual-fill-column-mode)

;; visual-fill-column-mode setup
(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))



;;
;; Custom functions
;; ====================

;; join line
(global-set-key (kbd "C-c j") 'join-line)

(global-set-key (kbd "M-Q") 'unfill-paragraph)


;; Export
(provide 'init-basic)
