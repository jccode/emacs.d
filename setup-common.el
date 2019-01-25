;; 
;; Vars
;; ====================

;; sync directory
(setq sync-home (expand-file-name "~/ownCloud"))


;; 
;; Functions
;; ====================

;; Load use custom files
(defun load-if-exist (f)
  "load the elisp file only if it exists and is readable"
  (if (file-readable-p f)
      (load-file f)))



(provide 'setup-common)
