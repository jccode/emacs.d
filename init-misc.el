(require 'use-package)


(use-package lorem-ipsum
  :ensure t
  :config
  (lorem-ipsum-use-default-bindings))

(use-package beacon
  :ensure t
  :config
  (beacon-mode 1))

;; chinese fonts
(use-package cnfonts
  :ensure t)

;; chinese input method
(setq package-check-signature nil)
(use-package pyim
  :ensure t
  ;; :demand t
  :config
  (use-package pyim-wbdict
    :ensure t
    :config (pyim-wbdict-v98-enable))
  (setq default-input-method "pyim")
  (setq pyim-default-scheme 'wubi)
  (setq pyim-page-length 5))


;; exec path
(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))

;; elfeed
(require 'setup-elfeed)

;; htmlize
(use-package htmlize
  :ensure t)


(provide 'init-misc)
