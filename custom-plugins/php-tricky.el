(defun auto-go ()
  "Inserts ';' if I'm in the middle of line, says ',' if I'm in the end of it"
  (interactive)
  (cond
   ((eolp)
    (insert ",")
    (newline-and-indent))
   ((eq ?\; (char-before (line-end-position)))
    (end-of-line)
    (newline-and-indent))
   (t
    (end-of-line)
    (insert ";"))))
(provide 'php-tricky)
