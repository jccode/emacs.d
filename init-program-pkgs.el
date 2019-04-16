(require 'use-package)

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

(use-package yasnippet-snippets
  :ensure t)

(use-package yaml-mode
  :ensure t)

(use-package dockerfile-mode
  :ensure t)

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)))

(use-package ledger-mode
  :ensure t)

(use-package ahk-mode
  :ensure t)

(use-package restclient
  :ensure t)

;; flycheck
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))


;; scala
;; (use-package ensime
;;   :ensure t)


;; haskell
;; (use-package haskell-mode
;;   :ensure t)

(use-package emmet-mode
  :ensure t
  :hook (mhtml-mode css-mode))


;; python
(setq py-python-command "python3")
(setq python-shell-interpreter "python3")


(provide 'init-program-pkgs)
