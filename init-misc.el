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
  :ensure t
  :config
  (cnfonts-mode 1)
  (setq cnfonts-use-face-font-rescale t))


;; chinese input method
;; (use-package pyim
;;   :ensure t
;;   ;; :demand t
;;   ;; :bind ("C-." . pyim-toggle-input-ascii)
;;   :config
;;   (use-package pyim-wbdict
;;     :ensure t
;;     :config (pyim-wbdict-v98-enable))
;;   (setq default-input-method "pyim")
;;   (setq pyim-default-scheme 'wubi)
;;   (setq pyim-page-length 5)
;;   (pyim-basedict-enable)
;;   (setq-default pyim-punctuation-translate-p '(no)) ;半角符号
;;   (use-package posframe
;;     :ensure t)
;;   (setq pyim-page-tooltip 'posframe))



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


;; emacs-smart-input-source (https://github.com/laishulu/emacs-smart-input-source)
(use-package sis
  :ensure t
  ;; :hook
  ;; enable the /context/ and /inline region/ mode for specific buffers
  ;; (((text-mode prog-mode) . sis-context-mode)
  ;;  ((text-mode prog-mode) . sis-inline-mode))

  :config

  (let ((is-windows (eq system-type 'windows-nt))
	(is-macos (eq system-type 'darwin)))
    (if is-windows (sis-ism-lazyman-config nil t 'w32))
    (if is-macos (sis-ism-lazyman-config
		  ;; English input source may be: "ABC", "US" or another one.
		  "com.apple.keylayout.ABC"
		  ;; "com.apple.keylayout.US"

		  ;; Other language input source: "rime", "sogou" or another one.
		  ;; "im.rime.inputmethod.Squirrel.Rime"
		  ;; "com.sogou.inputmethod.sogou.pinyin"
		  "com.apple.inputmethod.SCIM.WBX")))
  
  ;; ;; For MacOS
  ;; (sis-ism-lazyman-config

  ;;  ;; English input source may be: "ABC", "US" or another one.
  ;;  "com.apple.keylayout.ABC"
  ;;  ;; "com.apple.keylayout.US"

  ;;  ;; Other language input source: "rime", "sogou" or another one.
  ;;  ;; "com.sogou.inputmethod.sogou.pinyin"
  ;;  "com.apple.inputmethod.SCIM.WBX")
  
  ;; For windows
  ;; (sis-ism-lazyman-config "1033" "2052" 'im-select)
  ;; (sis-ism-lazyman-config nil t 'w32)
  ;; (sis-ism-lazyman-config nil "rime" 'native)

  ;; enable the /cursor color/ mode
  (sis-global-cursor-color-mode t)
  ;; enable the /respect/ mode
  (sis-global-respect-mode t)
  ;; enable the /context/ mode for all buffers
  (sis-global-context-mode t)
  ;; enable the /inline english/ mode for all buffers
  (sis-global-inline-mode t)
  )


(defun proxy-on ()
  "Turn proxy on"
  (interactive)
  (setq url-proxy-services
	'(("http" . "localhost:7890")
	  ("https" . "localhost:7890")
          )))

(defun proxy-off ()
  "Turn proxy off"
  (interactive)
  (setq url-proxy-services nil))


(provide 'init-misc)
