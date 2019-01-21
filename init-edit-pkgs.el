(require 'use-package)

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

(use-package iedit
  :ensure t)

(use-package smex
  :ensure t
  :bind (("M-x" . 'smex)
	 ("M-X" . 'smex-major-mode-commands)
	 ;; This is the old M-x
	 ("C-c C-c M-x" . 'execute-extended-command)))

(use-package perspective
  :ensure t
  :config
  (persp-mode t))

(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map)
  (projectile-mode +1))

(use-package persp-projectile
  :ensure t
  :bind ("C-x p ;" . 'projectile-persp-switch-project))


(provide 'init-edit-pkgs)
