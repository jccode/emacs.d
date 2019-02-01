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


;; elfeeds
(use-package elfeed
  :ensure t
  :bind ("C-x w" . 'elfeed)
  )

(use-package elfeed-org
  :ensure t
  :config
  (elfeed-org)
  (setq rmh-elfeed-org-files (list (expand-file-name "org/elfeed.org" sync-home))))



(provide 'init-misc)
