(require 'use-package)
(require 'setup-common)

;; Load birthday
(load-if-exist (expand-file-name "emacs/birthday.el" sync-home))

;; set general holidays
(setq cal-china-x-general-holidays '(
				     (holiday-fixed 2 14 "情人节")
				     (holiday-fixed 3 8 "妇女节")
				     (holiday-fixed 5 4 "青年节")
				     (holiday-fixed 6 1 "儿童节")
				     (holiday-fixed 9 10 "教师节")
				     (holiday-float 5 0 2 "母亲节")
				     (holiday-float 6 0 3 "父亲节")
				     (holiday-lunar 1 15 "元宵节" 0)
				     (holiday-lunar 7 7 "七夕" 0)
				     (holiday-fixed 12 25 "圣诞节")
				     ))

;; china holiday
(use-package cal-china-x
  :ensure t
  :config
  (setq calendar-holidays (append cal-china-x-chinese-holidays cal-china-x-general-holidays birthday)))
