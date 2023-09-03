
(defun random-alnum ()
  (let* ((alnum "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789")
         (i (% (abs (random)) (length alnum))))
    (substring alnum i (1+ i))))


(defun random-string (n)
  "Generate a slug of n random alphanumeric characters.
Inefficient implementation; don't use for large n."
  
  (if (= 0 n)
      ""
    (concat (random-alnum) (random-string (1- n)))))


(defun gen-password (&optional n)
  "Generate password. Default length is 12"
  (interactive (list (if current-prefix-arg ; <== User provide arg 
			 (prefix-numeric-value current-prefix-arg)
		       12))) 		; <== Default
  (insert (random-string n)))
;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Prefix-Command-Arguments.html


(defun insert-image-with-default-attributes (url caption)
  "Insert an Org Mode image with default attributes."
  (interactive "sImage URL: \nsCaption (optional): ")
  (insert (format "#+CAPTION: %s\n#+ATTR_HTML: :width 100%%\n[[%s]]"
		  caption url)))

