(defun buster-goto-current-test ()
  (search-backward-regexp "[\"'][^ ]* .+[\"']: function" nil t))

(defun buster-toggle-deffered ()
  (interactive)
  (buster-goto-current-test)
  (forward-char 1)
  (if (looking-at "//")
      (delete-char 2)
    (insert "//")))

(global-set-key (kbd "C-c C-b td") 'buster-toggle-deffered)

(provide 'buster-mode)
