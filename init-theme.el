(require 'use-package)

;;
;; Fonts
;; ====================


;; Variables, set-font
(defvar osx-p (string-match "darwin" (symbol-name system-type)))
(unless osx-p (set-default-font "consolas-10"))



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

to install the necessary icon fonts"

  (use-package doom-themes
    :ensure t
    :config (load-theme 'doom-molokai t))

  ;; Install the fonts by call:  M-x all-the-icons-install-fonts
  (use-package all-the-icons
    :ensure t)

  (use-package doom-modeline
    :ensure t
    :hook (after-init . doom-modeline-init))
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
