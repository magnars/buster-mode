(defun buster-goto-current-test ()
  (search-backward-regexp "[\"'][^ ]* .+[\"']: function" nil t))

(defun buster-toggle-deffered ()
  (interactive)
  (buster-goto-current-test)
  (forward-char 1)
  (if (looking-at "//")
      (delete-char 2)
    (insert "//")))

(defvar buster-mode-map (make-sparse-keymap)
  "buster-mode keymap")

(define-key buster-mode-map
  (kbd "C-c C-b td") 'buster-toggle-deffered)

(define-minor-mode buster-mode
  "Buster mode"
  nil
  " Buster"
  buster-mode-map)

(provide 'buster-mode)
