(defun buster-go-to-current-test ()
  (search-backward-regexp "\"[^ ]* .+\": function"))

(defun buster-toggle-deffered ()
  (interactive)
  (buster-go-to-current-test)
  (forward-char 1)
  (if (looking-at "//")
      (delete-char 2)
    (insert "//")))

(global-set-key (kbd "C-c C-b td") 'buster-toggle-deffered)

(provide 'buster-mode)
