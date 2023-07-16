(require 'use-package)
(require 'func-edit)

;; 
;; Basic settings
;; ====================

;; Default settings
(setq inhibit-startup-message t  ; No splash screen
      fill-column 120		 ; Width for line breaks
      tab-width 2
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

;; quiet, please! No dinging!
(setq ring-bell-function 'ignore)

;; 
;; Soft wrapping in emacs
;; 
(setq-default fill-column 120)

(global-visual-line-mode t)

(use-package visual-fill-column
  :ensure t
  :hook (visual-line-mode . visual-fill-column-mode))

;; fixed wrapping lines in visually
;; ref: https://github.com/hick/emacs-chinese/issues/9
(setq word-wrap-by-category t)

;; (use-package adaptive-wrap
;;   :ensure t
;;   :config
;;   (setq-default adaptive-wrap-extra-indent 2)
;;   :hook (visual-line-mode . adaptive-wrap-prefix-mode))


(set-language-environment "UTF-8")

;; chinese font
(use-package cnfonts
  :ensure t
  :config (cnfonts-mode 1))

;;
;; Custom functions
;; ====================

;; join line
(global-set-key (kbd "C-c j") 'join-line)

(global-set-key (kbd "M-Q") 'unfill-paragraph)


;; Export
(provide 'init-basic)
