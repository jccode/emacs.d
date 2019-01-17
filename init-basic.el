
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

;; themes
(use-package monokai-theme
  :ensure t
  :config (load-theme 'monokai t))

;; duplicate line
(global-set-key "\C-cd" "\C-a\C- \C-e\M-w\C-n\C-y")

(provide 'init-basic)
