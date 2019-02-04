(require 'use-package)
(require 'setup-common)

;; elfeeds
(use-package elfeed
  :ensure t
  :bind ("C-x w" . 'elfeed)
  )

(define-key elfeed-search-mode-map (kbd "j") 'next-line)
(define-key elfeed-search-mode-map (kbd "k") 'previous-line)


;; elfeed-org
(use-package elfeed-org
  :ensure t
  :config
  (elfeed-org)
  (setq rmh-elfeed-org-files (list (expand-file-name "org/elfeed.org" sync-home))))



;; (use-package elfeed-goodies
;;   :ensure t
;;   :config
;;   (elfeed-goodies/setup))

;; (define-key elfeed-show-mode-map (kbd "j") 'elfeed-goodies/split-show-next)
;; (define-key elfeed-show-mode-map (kbd "k") 'elfeed-goodies/split-show-prev)


(use-package elfeed-web
  :ensure t)



(provide 'setup-elfeed)
