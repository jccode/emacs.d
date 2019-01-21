;;
;; Pakcage manager
;; ====================

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Bootstrap `use-package`
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


;; Set up load path
(setq emacs-home (expand-file-name "~/emacs.d"))
(add-to-list 'load-path emacs-home)


;; Settings
(require 'init-basic)
(require 'init-theme)
(require 'init-edit-pkgs)
(require 'init-program-pkgs)
(require 'init-misc)


;; Load use custom files
(defun load-if-exist (f)
  "load the elisp file only if it exists and is readable"
  (if (file-readable-p f)
      (load-file f)))


