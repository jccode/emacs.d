(require 'use-package)

;;
;; Fonts
;; ====================


;; Variables, set-font
(defvar osx-p (string-match "darwin" (symbol-name system-type)))
;; Consolas-10
(unless osx-p (setq default-frame-alist '((font . "Consolas-10"))))

;; window size
(if (window-system)
    (progn
      (set-frame-height (selected-frame) 60)
      (set-frame-width (selected-frame) 150)
      ))



;; 
;; Themes
;; ====================

;; (use-package monokai-theme
;;   :ensure t
;;   :config (load-theme 'monokai t))


(defun setup-doom-themes-modeline ()
  "Setup doom themes and doom modeline. 
To ensure doom-modeline works properly, you should manually call

  M-x all-the-icons-install-fonts
  M-x nerd-icons-install-fonts

to install the necessary icon fonts"

  (use-package doom-themes
    :ensure t
    :config
    ;; Global settings (defaults)
    (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
          doom-themes-enable-italic t) ; if nil, italics is universally disabled
    (load-theme 'doom-monokai-classic t)
    
    ;; Enable flashing mode-line on errors
    (doom-themes-visual-bell-config)
    ;; Enable custom neotree theme (all-the-icons must be installed!)
    (doom-themes-neotree-config)
    ;; or for treemacs users
    (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
    (doom-themes-treemacs-config)
    ;; Corrects (and improves) org-mode's native fontification.
    (doom-themes-org-config))

  ;; Install the fonts by call:  M-x all-the-icons-install-fonts
  (use-package all-the-icons
    :ensure t)

  (use-package doom-modeline
    :ensure t
    :hook (after-init . doom-modeline-mode))
  )

(setup-doom-themes-modeline)


(defun setup-smart-mode-line-theme ()
  "Setup smart mode line & themes"
  
  (use-package smart-mode-line-powerline-theme
    :ensure t)

  (use-package smart-mode-line
    :ensure t
    :custom (sml/theme 'respectful)
    :config (sml/setup))
  )





(provide 'init-theme)
