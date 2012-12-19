(When "^I go to character \"\\(.+\\)\"$"
      (lambda (char)
        (goto-char (point-min))
        (let ((search (re-search-forward (format "%s" char) nil t))
              (message "Can not go to character '%s' since it does not exist in the current buffer: %s"))
          (assert search nil message char (espuds-buffer-contents)))))

(When "^I go to the \\(front\\|end\\) of the word \"\\(.+\\)\"$"
      (lambda (pos word)
        (goto-char (point-min))
        (let ((search (re-search-forward (format "%s" word) nil t))
              (message "Can not go to character '%s' since it does not exist in the current buffer: %s"))
          (assert search nil message word (espuds-buffer-contents))
          (if (string-equal "front" pos) (backward-word)))))

(When "^I wait for the compilation to finish$"
     (lambda ()
       (setq ecukes--waiting-for-compilation t)

       (defun ecukes--compilation-finished (&rest ignore)
         (setq ecukes--waiting-for-compilation nil)
         (remove-hook 'compilation-finish-functions 'ecukes--compilation-finished))

       (add-hook 'compilation-finish-functions 'ecukes--compilation-finished)

       (while ecukes--waiting-for-compilation
         (accept-process-output nil 0.005))
       ))

(And "^I have passing tests$"
     (lambda ()
       (setq buster-compile-command "cat features/stubs/passing-tests")))

(And "^I have failing tests$"
     (lambda ()
       (setq buster-compile-command "cat features/stubs/failing-tests")))
