(require 'use-package)

;; 
;; Encrypting org files  (which is enable by default)
;; 

;; (require 'epa-file)
;; (epa-file-enable)  ; default behavior

;; Control whether or not to pop up the key selection dialog.
(setq epa-file-select-keys 0)

;; ask encryption password once
(setq epa-file-cache-passphrase-for-symmetric-encryption t)





;;
;; Enable minibuffer pinentry 
;; 
;; Ref:
;; 1. https://coldnew.github.io/e7fdea95/

;; GnuPG 2.1 or later has an option to control the behavior of
;; Pinentry invocation.  When set this to `loopback', which redirects
;; all Pinentry queries to the caller, so Emacs can query passphrase
;; through the minibuffer instead of external Pinentry program.

(require 'epa)
(setq epa-pinentry-mode 'loopback)


(use-package pinentry
  :ensure t
  :config
  (pinentry-start))

;; Issue for epg not running
;; Ref: http://emacs.1067599.n8.nabble.com/23-0-60-EasyPG-and-OpenPGP-smartcard-process-epg-not-running-td181029.html
(setq epg-gpg-minimum-version "100")




;;
;; Encrypting specific entries in an org file by 'org-crypt'
;; 
;; 

(require 'org-crypt)
(org-crypt-use-before-save-magic)

;; default encrypt tag is: crypt;
;; exclude this tag from inheritance.
(setq org-tags-exclude-from-inheritance (quote ("crypt")))

;; GPG key to use for encryption
;; Either the Key ID or set to nil to use symmetric encryption.
;; (setq org-crypt-key nil)
(setq org-crypt-key "junchangchen@gmail.com")




;;
;;
;; debug
;;

;; (setq epg-debug-buffer t)
;; (setq epg-debug t)



(provide 'setup-org-epa)
