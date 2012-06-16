(let* ((current-directory (file-name-directory load-file-name))
       (features-directory (expand-file-name ".." current-directory))
       (project-directory (expand-file-name ".." features-directory)))
  (setq buster-mode-root-path project-directory)
  (setq buster-mode-util-path (expand-file-name "util" project-directory)))

(add-to-list 'load-path buster-mode-root-path)
(add-to-list 'load-path (expand-file-name "espuds" buster-mode-util-path))

(require 'buster-mode)
(require 'espuds)
(require 'ert)

(Before
 (switch-to-buffer
  (get-buffer-create "*testing-buffer*"))
 (erase-buffer)
 (transient-mark-mode 1)
 (cua-mode 0)
 (buster-mode 0)
 (setq set-mark-default-inactive nil)
 (deactivate-mark))

(After)
