;; org mode setup
(require 'setup-common)

;; org mode basic key-bindings
;; (global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)


;; Org settings
(setq org-directory (expand-file-name "org" sync-home))
(setq org-default-notes-file (expand-file-name "note.org" org-directory))


;; Capture
(setq org-capture-templates
      '(("t" "Task" entry (file+headline org-default-notes-file "Tasks")
	 "* TODO %?\n %i\n %a" :prepend t)
	("w" "Work" entry (file+datetree (expand-file-name "work/w.org" sync-home))
	 "* TODO %?\n%i" :tree-type week :prepend t :clock-in t :clock-keep t)
	("j" "Journal" entry (file+datetree (expand-file-name "journal.org" org-directory))
	 "* %U %?")
	("a" "Appointment" entry (file (expand-file-name "gcal.org" org-directory))
	 "* %?\n\n%^T\n\n:PROPERTIES:\n\n:END:\n\n")
	("i" "Idea" entry (file+headline org-default-notes-file "Ideas")
	 "* %?\n%T" :prepend t)
	("n" "Note" entry (file+headline org-default-notes-file "Notes")
	 "* %u %? " :prepend t)
	("l" "Link" entry (file+headline (expand-file-name "links.org" org-directory))
	 "* %? %^L %^g \n%T")
	))


;; Agenda
(setq org-agenda-files
      (list
       org-default-notes-file
       (expand-file-name "journal.org" org-directory)
       (expand-file-name "gcal.org" org-directory)
       (expand-file-name "work/w.org" sync-home)
       ))


;; export
(provide 'init-org)
