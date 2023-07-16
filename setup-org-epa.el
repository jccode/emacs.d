(require 'use-package)


;; 
;; Encrypting org files  (which is enable by default)
;; 

;; (require 'epa-file)
;; (epa-file-enable)  ; which is enabled by default

;; Control whether or not to pop up the key selection dialog.
(setq epa-file-select-keys 0)

;; ask encryption password once
(setq epa-file-cache-passphrase-for-symmetric-encryption t)




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






;;
;; Enable minibuffer pinentry (method 1)
;;
;; Usage:
;; 1. Put below to "~/.gnupg/gpg-agent.conf"
;;
;;        # Emacs support
;;        allow-emacs-pinentry
;;        allow-loopback-pinentry
;;        
;;        # (optional) if you want to set timeout (second)
;;        pinentry-timeout 3
;; 
;; 2. Call below function (setup-gpg-minibuffer-1) to enable it.
;; 
;; 
;; Ref:
;; 1. https://coldnew.github.io/e7fdea95/
;;
(defun setup-gpg-minibuffer-1 ()
  "Setup working with password prompt in minibuffer"

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
  ;; (setq epg-gpg-minimum-version "100")

  )




;;
;; Enable minibuffer pinentry (method 2)
;;
;; Usage:
;; 1. git clone https://github.com/ecraven/pinentry-emacs.git ~/.emacs.d/pinentry-emacs
;; 
;; 2. Put below to "~/.gnupg/gpg-agent.conf"
;;
;;        pinentry-program ~/.emacs.d/pinentry-emacs/pinentry-emacs
;; 
;; 3. Call below function (setup-gpg-minibuffer-2) to enable it.
;; 
(defun setup-gpg-minibuffer-2 ()
  "Setup working with password prompt in minibuffer (method 2)"

  ;; defind pinentry-emacs function
  (defun pinentry-emacs (desc prompt ok error)
    (let ((str (read-passwd (concat (replace-regexp-in-string "%22" "\"" (replace-regexp-in-string "%0A" "\n" desc)) prompt ": "))))
      str))
  
  )


;; 
;; Using method 1 by default; unless in docker container
;; 
;; Because method 1 not work perfectly in docker container.
;;

;; (if (getenv "INSIDE_DOCKER") (setup-gpg-minibuffer-2) (setup-gpg-minibuffer-1))

(setup-gpg-minibuffer-1)


(provide 'setup-org-epa)
