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


(defmacro with-system (type &rest body)
  "Evaluate BODY if `system-type' equals TYPE."
  (declare (indent defun))
  `(when (eq system-type ',type)
     ,@body))

;; macro test
;; (with-system gnu/linux
;;   (message "Free as in Beer"))
;; (with-system windows-nt
;;   (message "windows nt"))
;; (with-system darwin
;;   (message "macOS"))


(provide 'setup-common)
