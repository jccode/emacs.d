(require 'use-package)
(require 'setup-common)

;; Org mod setup


;; org mode basic key-bindings
;; (global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)


;; Org settings
(setq org-directory (expand-file-name "org" sync-home))
(setq org-default-notes-file (expand-file-name "note.org" org-directory))
(setq org-vocabulary-file (expand-file-name "vocabulary.org" org-directory))


;; Capture
(setq org-file-work (expand-file-name "work/w.org" sync-home))
(setq org-capture-templates
      '(("t" "Task" entry (file+headline org-default-notes-file "Tasks")
	 "* TODO %?\n %i\n %a" :prepend t)
	("w" "Work" entry (file+datetree org-file-work)
	 "* TODO %?\n%i" :tree-type week :prepend t :clock-in t :clock-keep t)
	("j" "Journal" entry (file+datetree "journal.org.gpg")
	 "* %U %?")
	("a" "Appointment" entry (file "gcal.org")
	 "* %?\n\n%^T\n\n:PROPERTIES:\n\n:END:\n\n")
	("i" "Idea" entry (file+headline org-default-notes-file "Ideas")
	 "* %?\n%T" :prepend t)
	("n" "Note" entry (file+headline org-default-notes-file "Notes")
	 "* %u %? " :prepend t)
	("l" "Link" entry (file+headline "links.org" "Links")
	 "* %? %^L %^g \n%T" :prepend t)
	("v" "Vocabulary" entry (file+headline org-vocabulary-file "Vocabulary")
	 "* %?\n%u" :prepend t :empty-lines 1)
	))



;; Agenda
(setq org-agenda-files
      (list
       org-default-notes-file
       (expand-file-name "journal.org" org-directory)
       (expand-file-name "gcal.org" org-directory)
       (expand-file-name "work/w.org" sync-home)
       ))


;; Diary
(setq diary-file (expand-file-name "diary" org-directory))


;; org-mode bable language
(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)
   (ditaa . t)
   (ledger . t)
   (python . t)
   (java . t)
   (latex . t)))

(require 'org-tempo)


;; 
;; Org capture in new frame; close the frame once 'C-c C-c'
;;
;; To run active it, bind a OS hotkey to below command:
;;    emacsclient -ne '(make-capture-frame)'
;;
;; For running emacs in windows docker container:
;;    "docker exec -it emacs bash -c \"emacsclient -ne '(make-capture-frame)'\""
;; 
(use-package noflet
  :ensure t )
(defun make-capture-frame ()
  "Create a new frame and run org-capture."
  (interactive)
  (make-frame '((name . "capture")))
  (select-frame-by-name "capture")
  (delete-other-windows)
  (noflet ((switch-to-buffer-other-window (buf) (switch-to-buffer buf)))
    (org-capture)))

(defadvice org-capture-finalize 
    (after delete-capture-frame activate)  
  "Advise capture-finalize to close the frame"  
  (if (equal "capture" (frame-parameter nil 'name))  
      (delete-frame)))

(defadvice org-capture-destroy 
    (after delete-capture-frame activate)  
  "Advise capture-destroy to close the frame"  
  (if (equal "capture" (frame-parameter nil 'name))  
      (delete-frame)))  



;; Unset key bindings
(add-hook 'org-mode-hook
	  (lambda ()
	    (local-unset-key (kbd "C-c SPC")) ;; conflict with AceJump
	    ))



;; emacs encrypt settings
(require 'setup-org-epa)

;; org-pomodoro
(use-package org-pomodoro
  :ensure t)

;; export
(provide 'init-org)
