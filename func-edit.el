
;;; Stefan Monnier <foo at acm.org>. It is the opposite of fill-paragraph    
(defun unfill-paragraph (&optional region)
  "Takes a multi-line paragraph and makes it into a single line of text."
  (interactive (progn (barf-if-buffer-read-only) '(t)))
  (let ((fill-column (point-max))
        ;; This would override `fill-column' if it's an integer.
        (emacs-lisp-docstring-fill-column t))
    (fill-paragraph nil region)))


;; json escape
(defun json-escape (begin end)
  "escape json string"
  (interactive "r")
  (setq str (buffer-substring begin end))
  (setq r1 (replace-regexp-in-string "\\\\" "\\\\\\\\" str))
  (setq rn (replace-regexp-in-string "\"" "\\\\\"" r1))
  (kill-new rn)
  (message "Escape: %s" rn)
  )



(provide 'func-edit)
