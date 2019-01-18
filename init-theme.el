(require 'use-package)

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


;; Variables, set-font
(defvar osx-p (string-match "darwin" (symbol-name system-type)))
(unless osx-p (set-default-font "consolas-10"))


(provide 'init-theme)
