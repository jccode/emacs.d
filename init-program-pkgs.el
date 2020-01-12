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
;; (use-package flycheck
;;   :ensure t
;;   :init
;;   (global-flycheck-mode t))


;; scala
;; (use-package ensime
;;   :ensure t)


;; haskell
;; (use-package haskell-mode
;;   :ensure t
;;   :config
;;   (progn
;;     (require 'haskell-interactive-mode)
;;     (require 'haskell-process)
;;     (add-hook 'haskell-mode-hook 'interactive-haskell-mode)
;;     (custom-set-variables
;;      '(haskell-process-suggest-remove-import-lines t)
;;      '(haskell-process-auto-import-loaded-modules t)
;;      '(haskell-process-log t))
;;     ))

(use-package emmet-mode
  :ensure t
  :hook (mhtml-mode css-mode))


;; python
(setq py-python-command "python3")
(setq python-shell-interpreter "python3")


;; common-lisp
(use-package slime
  :ensure t
  :config
  (progn
    (setq inferior-lisp-program "/usr/local/bin/ccl")
    ;; contrib
    (add-to-list 'slime-contribs 'slime-repl)
    ))


(provide 'init-program-pkgs)
