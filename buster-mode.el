(defun buster-goto-current-test ()
  (search-backward-regexp "[\"'][^ ]* .+[\"']: function" nil t))

(defun buster-toggle-test-name-prefix (prefix)
  (save-excursion
    (buster-goto-current-test)
    (forward-char 1)
    (if (not (looking-at prefix))
        (insert prefix " ")
      (delete-char (length prefix))
      (while (looking-at " ") (delete-char 1)))))

(defun buster-toggle-deffered ()
  (interactive)
  (buster-toggle-test-name-prefix "//"))

(defun buster-toggle-focus-rocket ()
  (interactive)
  (buster-toggle-test-name-prefix "=>"))

(defun buster-run-all-tests ()
  (interactive)
  (switch-to-buffer-other-window "*buster-test*")
  (call-process "buster-test" nil "*buster-test*" t))

(defvar buster-mode-map (make-sparse-keymap)
  "buster-mode keymap")

(define-key buster-mode-map
  (kbd "C-c C-b td") 'buster-toggle-deffered)
(define-key buster-mode-map
  (kbd "C-c C-b tf") 'buster-toggle-focus-rocket)
(define-key buster-mode-map
  (kbd "C-c C-b ra") 'buster-run-all-tests)

(define-minor-mode buster-mode
  "Buster mode"
  nil
  " Buster"
  buster-mode-map)

(provide 'buster-mode)
