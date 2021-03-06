(require 'use-package)
(require 'setup-common)

;; Settings
(setq user-full-name "jcchen"
      user-mail-address "junchangchen@gmail.com")


;; Custom keymap
(define-prefix-command 'ctrl-x-j-map)
(global-set-key (kbd "C-x j") 'ctrl-x-j-map)

;; Custom keybinds
(define-key ctrl-x-j-map (kbd "p e") 'encrypt-password)
(define-key ctrl-x-j-map (kbd "p d") 'decrypt-password)
(define-key ctrl-x-j-map (kbd "p g") 'gen-password)
(define-key ctrl-x-j-map (kbd "b e") 'base64-encode-region)
(define-key ctrl-x-j-map (kbd "b d") 'base64-decode-region)


(use-package string-inflection
  :ensure t
  :bind (:map ctrl-x-j-map
	      ("c a" . string-inflection-all-cycle)
	      ("c c" . string-inflection-lower-camelcase)
	      ("c _" . string-inflection-underscore)
	      ("c -" . string-inflection-kebab-case)
	      ))

