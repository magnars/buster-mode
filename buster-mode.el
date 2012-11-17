;;; buster-mode.el --- Minor mode to speed up development when writing tests with Buster.js

;; Copyright (C) 2011 Magnar Sveen, Christian Johansen

;; Authors: Magnar Sveen <magnars@gmail.com>
;;          Christian Johansen <christian@cjohansen.no>
;; Keywords: buster testing javascript

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; A work in progress. You can watch us livecode it on http://emacsrocks.com

;; All keybindings in buster-mode start with `C-c C-b` and then a two-letter mnemonic shortcut.

;; * `td`: toggle-deferred will toggle // in the name of the current test.
;; * `tf`: toggle-focus-rocket will toggle => in the name of the current test.
;; * `ra`: run-all-tests

;;; Code:


(require 'ansi-color)

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

(defun buster-toggle-deferred ()
  (interactive)
  (buster-toggle-test-name-prefix "//"))

(defun buster-toggle-focus-rocket ()
  (interactive)
  (buster-toggle-test-name-prefix "=>"))

(defun buster--convert-ansi-escape-sequences (start end)
  (goto-char start)
  (while (search-forward "[1D" end t)
    (delete-backward-char 5)))

(defun buster-run-all-tests ()
  (interactive)
  (switch-to-buffer-other-window "*buster-test*")
  (erase-buffer)
  (call-process "buster-test" nil "*buster-test*" t)
  (ansi-color-apply-on-region (point-min) (point-max))
  (buster--convert-ansi-escape-sequences (point-min) (point-max)))

(defvar buster-mode-map (make-sparse-keymap)
  "buster-mode keymap")

(define-key buster-mode-map
  (kbd "C-c C-b td") 'buster-toggle-deferred)
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

;;; buster-mode.el ends here
