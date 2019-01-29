(require 'use-package)

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




;;
;; Convert Full-Width/Half-Width Punctuations
;;
;; Ref: http://ergoemacs.org/emacs/elisp_convert_chinese_punctuation.html
;; 
(use-package xah-replace-pairs
  :ensure t)

(defun xah-convert-english-chinese-punctuation (@begin @end &optional @to-direction)
  "Convert punctuation from/to English/Chinese characters.

When called interactively, do current line or selection. The conversion direction is automatically determined.

If `universal-argument' is called, ask user for change direction.

When called in lisp code, *begin *end are region begin/end positions. *to-direction must be any of the following values: 「\"chinese\"」, 「\"english\"」, 「\"auto\"」.

See also: `xah-remove-punctuation-trailing-redundant-space'.

URL `http://ergoemacs.org/emacs/elisp_convert_chinese_punctuation.html'
Version 2015-10-05"
  (interactive
   (let ($p1 $p2)
     (if (use-region-p)
         (progn
           (setq $p1 (region-beginning))
           (setq $p2 (region-end)))
       (progn
         (setq $p1 (line-beginning-position))
         (setq $p2 (line-end-position))))
     (list
      $p1
      $p2
      (if current-prefix-arg
          (ido-completing-read
           "Change to: "
           '( "english"  "chinese")
           "PREDICATE"
           "REQUIRE-MATCH")
        "auto"
        ))))
  (let (
        ($input-str (buffer-substring-no-properties @begin @end))
        ($replacePairs
         [
          [". " "。"]
          [".\n" "。\n"]
          [", " "，"]
          [",\n" "，\n"]
          [": " "："]
          ["; " "；"]
          ["? " "？"] ; no space after
          ["! " "！"]

          ;; for inside HTML
          [".</" "。</"]
          ["?</" "？</"]
          [":</" "：</"]
          [" " "　"]
          ]
         ))

    (when (string= @to-direction "auto")
      (setq
       @to-direction
       (if
           (or
            (string-match "　" $input-str)
            (string-match "。" $input-str)
            (string-match "，" $input-str)
            (string-match "？" $input-str)
            (string-match "！" $input-str))
           "english"
         "chinese")))
    (save-excursion
      (save-restriction
        (narrow-to-region @begin @end)
        (mapc
         (lambda ($x)
           (progn
             (goto-char (point-min))
             (while (search-forward (aref $x 0) nil "noerror")
               (replace-match (aref $x 1)))))
         (cond
          ((string= @to-direction "chinese") $replacePairs)
          ((string= @to-direction "english") (mapcar (lambda (x) (vector (elt x 1) (elt x 0))) $replacePairs))
          (t (user-error "Your 3rd argument 「%s」 isn't valid" @to-direction))))))))


(defun xah-remove-punctuation-trailing-redundant-space (@begin @end)
  "Remove redundant whitespace after punctuation.
Works on current line or text selection.

When called in emacs lisp code, the *begin *end are cursor positions for region.

See also `xah-convert-english-chinese-punctuation'.

URL `http://ergoemacs.org/emacs/elisp_convert_chinese_punctuation.html'
version 2015-08-22"
  (interactive
   (if (use-region-p)
       (list (region-beginning) (region-end))
     (list (line-beginning-position) (line-end-position))))
  (require 'xah-replace-pairs)
  (xah-replace-regexp-pairs-region
   @begin @end
   [
    ;; clean up. Remove extra space.
    [" +," ","]
    [",  +" ", "]
    ["?  +" "? "]
    ["!  +" "! "]
    ["\\.  +" ". "]

    ;; fullwidth punctuations
    ["， +" "，"]
    ["。 +" "。"]
    ["： +" "："]
    ["？ +" "？"]
    ["； +" "；"]
    ["！ +" "！"]
    ["、 +" "、"]
    ]
   "FIXEDCASE" "LITERAL"))

(defun xah-convert-fullwidth-chars (@begin @end &optional @to-direction)
  "Convert ASCII chars to/from Unicode fullwidth version.
Works on current line or text selection.

The conversion direction is determined like this: if the command has been repeated, then toggle. Else, always do to-Unicode direction.

If `universal-argument' is called first:

 no C-u → Automatic.
 C-u → to ASCII
 C-u 1 → to ASCII
 C-u 2 → to Unicode

When called in lisp code, @begin @end are region begin/end positions. @to-direction must be any of the following values: 「\"unicode\"」, 「\"ascii\"」, 「\"auto\"」.

See also: `xah-remove-punctuation-trailing-redundant-space'.

URL `http://ergoemacs.org/emacs/elisp_convert_chinese_punctuation.html'
Version 2018-08-02"
  (interactive
   (let ($p1 $p2)
     (if (use-region-p)
         (progn
           (setq $p1 (region-beginning))
           (setq $p2 (region-end)))
       (progn
         (setq $p1 (line-beginning-position))
         (setq $p2 (line-end-position))))
     (list $p1 $p2
           (cond
            ((equal current-prefix-arg nil) "auto")
            ((equal current-prefix-arg '(4)) "ascii")
            ((equal current-prefix-arg 1) "ascii")
            ((equal current-prefix-arg 2) "unicode")
            (t "unicode")))))
  (let* (
         ($ascii-unicode-map
          [
           ["0" "０"] ["1" "１"] ["2" "２"] ["3" "３"] ["4" "４"] ["5" "５"] ["6" "６"] ["7" "７"] ["8" "８"] ["9" "９"]
           ["A" "Ａ"] ["B" "Ｂ"] ["C" "Ｃ"] ["D" "Ｄ"] ["E" "Ｅ"] ["F" "Ｆ"] ["G" "Ｇ"] ["H" "Ｈ"] ["I" "Ｉ"] ["J" "Ｊ"] ["K" "Ｋ"] ["L" "Ｌ"] ["M" "Ｍ"] ["N" "Ｎ"] ["O" "Ｏ"] ["P" "Ｐ"] ["Q" "Ｑ"] ["R" "Ｒ"] ["S" "Ｓ"] ["T" "Ｔ"] ["U" "Ｕ"] ["V" "Ｖ"] ["W" "Ｗ"] ["X" "Ｘ"] ["Y" "Ｙ"] ["Z" "Ｚ"]
           ["a" "ａ"] ["b" "ｂ"] ["c" "ｃ"] ["d" "ｄ"] ["e" "ｅ"] ["f" "ｆ"] ["g" "ｇ"] ["h" "ｈ"] ["i" "ｉ"] ["j" "ｊ"] ["k" "ｋ"] ["l" "ｌ"] ["m" "ｍ"] ["n" "ｎ"] ["o" "ｏ"] ["p" "ｐ"] ["q" "ｑ"] ["r" "ｒ"] ["s" "ｓ"] ["t" "ｔ"] ["u" "ｕ"] ["v" "ｖ"] ["w" "ｗ"] ["x" "ｘ"] ["y" "ｙ"] ["z" "ｚ"]
           ["," "，"] ["." "．"] [":" "："] [";" "；"] ["!" "！"] ["?" "？"] ["\"" "＂"] ["'" "＇"] ["`" "｀"] ["^" "＾"] ["~" "～"] ["¯" "￣"] ["_" "＿"]
           [" " "　"]
           ["&" "＆"] ["@" "＠"] ["#" "＃"] ["%" "％"] ["+" "＋"] ["-" "－"] ["*" "＊"] ["=" "＝"] ["<" "＜"] [">" "＞"] ["(" "（"] [")" "）"] ["[" "［"] ["]" "］"] ["{" "｛"] ["}" "｝"] ["(" "｟"] [")" "｠"] ["|" "｜"] ["¦" "￤"] ["/" "／"] ["\\" "＼"] ["¬" "￢"] ["$" "＄"] ["£" "￡"] ["¢" "￠"] ["₩" "￦"] ["¥" "￥"]
           ]
          )
         ($reverse-map
          (mapcar
           (lambda (x) (vector (elt x 1) (elt x 0)))
           $ascii-unicode-map))

         ($stateBefore
          (if (get 'xah-convert-fullwidth-chars 'state)
              (get 'xah-convert-fullwidth-chars 'state)
            (progn
              (put 'xah-convert-fullwidth-chars 'state 0)
              0
              )))
         ($stateAfter (if (eq $stateBefore 0) 1 0 )))

					;"０\\|１\\|２\\|３\\|４\\|５\\|６\\|７\\|８\\|９\\|Ａ\\|Ｂ\\|Ｃ\\|Ｄ\\|Ｅ\\|Ｆ\\|Ｇ\\|Ｈ\\|Ｉ\\|Ｊ\\|Ｋ\\|Ｌ\\|Ｍ\\|Ｎ\\|Ｏ\\|Ｐ\\|Ｑ\\|Ｒ\\|Ｓ\\|Ｔ\\|Ｕ\\|Ｖ\\|Ｗ\\|Ｘ\\|Ｙ\\|Ｚ\\|ａ\\|ｂ\\|ｃ\\|ｄ\\|ｅ\\|ｆ\\|ｇ\\|ｈ\\|ｉ\\|ｊ\\|ｋ\\|ｌ\\|ｍ\\|ｎ\\|ｏ\\|ｐ\\|ｑ\\|ｒ\\|ｓ\\|ｔ\\|ｕ\\|ｖ\\|ｗ\\|ｘ\\|ｙ\\|ｚ"

    ;; (message "before %s" $stateBefore)
    ;; (message "after %s" $stateAfter)
    ;; (message "@to-direction %s" @to-direction)
    ;; (message "real-this-command  %s" real-this-command)
    ;; (message "real-last-command %s" real-last-command)
    ;; (message "this-command  %s" this-command)
    ;; (message "last-command %s" last-command)

    (let ((case-fold-search nil))
      (xah-replace-pairs-region
       @begin @end
       (cond
        ((string= @to-direction "unicode") $ascii-unicode-map)
        ((string= @to-direction "ascii") $reverse-map)
        ((string= @to-direction "auto")
         (if (eq $stateBefore 0)
             $reverse-map
           $ascii-unicode-map )

         ;; 2018-08-02 this doesn't work when using smex
         ;; (if (eq last-command this-command)
         ;;     (progn
         ;;       (message "%s" "repeated")
         ;;       (if (eq $stateBefore 0)
         ;;           $reverse-map
         ;;         $ascii-unicode-map ))
         ;;   (progn
         ;;     (message "%s" "not repeated")
         ;;     $ascii-unicode-map))

         ;;

         )
        (t (user-error "Your 3rd argument 「%s」 isn't valid" @to-direction)))
       t t ))
    (put 'xah-convert-fullwidth-chars 'state $stateAfter)))




;; Exports

(provide 'func-edit)
