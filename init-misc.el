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
(use-package pyim
  :ensure t
  ;; :demand t
  :bind ("C-." . pyim-toggle-input-ascii)
  :config
  (use-package pyim-wbdict
    :ensure t
    :config (pyim-wbdict-v98-enable))
  (setq default-input-method "pyim")
  (setq pyim-default-scheme 'wubi)
  (setq pyim-page-length 5)
  (pyim-basedict-enable)
  (setq-default pyim-punctuation-translate-p '(no)) ;半角符号
  (use-package posframe
    :ensure t)
  (setq pyim-page-tooltip 'posframe))



;; exec path
(when (not (eq system-type 'windows-nt))
  (use-package exec-path-from-shell
    :ensure t
    :config
    (exec-path-from-shell-initialize)))

;; elfeed
(require 'setup-elfeed)

;; htmlize
(use-package htmlize
  :ensure t)


;; atomic-chrome
(use-package atomic-chrome
  :ensure t
  :config
  (atomic-chrome-start-server))


(provide 'init-misc)
