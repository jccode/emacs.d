(require 'use-package)
(require 'setup-common)

;; hugo
(setq blog-dir (expand-file-name "~/code/blog"))
(use-package easy-hugo
  :ensure t
  :init
  (setq easy-hugo-basedir blog-dir)
  (setq easy-hugo-url "https://yourblogdomain")
  (setq easy-hugo-sshdomain "blogdomain")
  (setq easy-hugo-root "/home/blog/")
  (setq easy-hugo-previewtime "300")
  (setq easy-hugo-postdir "content/posts")
  :bind ("C-c h" . easy-hugo))


;; ox-hugo
(use-package ox-hugo
  :ensure t            ;Auto-install the package from Melpa (optional)
  :after ox)



;; hugo org-capture template

;; Populates only the EXPORT_FILE_NAME property in the inserted headline.
(with-eval-after-load 'org-capture
  (defun org-hugo-new-subtree-post-capture-template ()
    "Returns `org-capture' template string for new Hugo post.
See `org-capture-templates' for more information."
    (let* (;; http://www.holgerschurig.de/en/emacs-blog-from-org-to-hugo/
           (date (format-time-string (org-time-stamp-format :long :inactive) (org-current-time)))
           (title (read-from-minibuffer "Post Title: ")) ;Prompt to enter the post title
           (fname (org-hugo-slug title)))
      (mapconcat #'identity
		 `(
                   ,(concat "* TODO " title)
                   ":PROPERTIES:"
                   ,(concat ":EXPORT_FILE_NAME: " fname)
                   ,(concat ":EXPORT_DATE: " date) ;Enter current date and time
                   ":END:"
                   "%?\n")                ;Place the cursor here finally
		 "\n")))

  
  ;; Capture templates
  (add-to-list 'org-capture-templates
               '("h" "Hugo post" entry (file "posts.org")
                 (function org-hugo-new-subtree-post-capture-template)
		 :prepend t :empty-lines-before 1 :empty-lines-after 1)))
