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

;; js,css indent settings
(setq js-indent-level 2)
(setq css-indent-offset 2)


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


;; sql indent
(use-package sql-indent
  :ensure t
  :hook (sql-mode . sqlind-minor-mode))

;; plantuml
(use-package plantuml-mode
  :ensure t
  :config
  (setq jar-file (expand-file-name "emacs/plantuml-1.2022.12.jar" sync-home))
  (setq plantuml-jar-path jar-file)
  (setq plantuml-default-exec-mode 'jar)
  (setq org-plantuml-jar-path jar-file)
  ;; (setq org-plantuml-jar-path
  ;; 	(expand-file-name "emacs/plantuml-1.2022.12.jar" sync-home))
  (add-to-list 'auto-mode-alist '("\\.plantuml\\'" . plantuml-mode)))


;; scala
;; (use-package ensime
;;   :ensure t)

(defun setup-scala ()
  "scala setup"

  ;; Enable scala-mode and sbt-mode
  (use-package scala-mode
    :mode "\\.s\\(cala\\|bt\\)$")

  (use-package sbt-mode
    :commands sbt-start sbt-command
    :config
    ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
    ;; allows using SPACE when in the minibuffer
    (substitute-key-definition
     'minibuffer-complete-word
     'self-insert-command
     minibuffer-local-completion-map)
    ;; sbt-supershell kills sbt-mode:  https://github.com/hvesalai/emacs-sbt-mode/issues/152
    (setq sbt:program-options '("-Dsbt.supershell=false"))
    )

  (use-package lsp-mode
    ;; Optional - enable lsp-mode automatically in scala files
    :hook (scala-mode . lsp)
    :config (setq lsp-prefer-flymake nil))

  (use-package lsp-ui)
  (use-package company-lsp))

;; (setup-scala)

;; rust
(use-package rust-mode
  :ensure t
  :init
  (add-hook 'rust-mode-hook
	    (lambda () (setq indent-tabs-mode nil)))
  :config
  (setq rust-format-on-save t)
  :bind ("C-c C-c" . 'rust-run))


(use-package lua-mode
  :ensure t
  :mode "\\.lua$"
  :interpreter "lua")

(use-package json-mode
  :ensure t)

(use-package nginx-mode
  :ensure t)

(provide 'init-program-pkgs)
