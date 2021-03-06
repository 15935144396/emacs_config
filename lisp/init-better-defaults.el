 (setq ring-bell-function 'ignore)

(global-auto-revert-mode t)
(abbrev-mode t)

(define-abbrev-table 'global-abbrev-table '(("fww" "fengww")))


(setq make-backup-files nil)
(setq auto-save-default nil)

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)


(delete-selection-mode t)



(global-hl-line-mode t)



(require 'recentf)
(recentf-mode 1)			
(setq recentf-max-menu-items 25)
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indent selected region."))
      (progn
	(indent-buffer)
	(message "Indent buffer.")))))


(setq hippie-expand-try-function-list '(try-expand-debbrev
					try-expand-debbrev-all-buffers
					try-expand-debbrev-from-kill
					try-complete-file-name-partially
					try-complete-file-name
					try-expand-all-abbrevs
					try-expand-list
					try-expand-line
					try-complete-lisp-symbol-partially
					try-complete-lisp-symbol))
(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)
(put 'dired-find-alternate-file 'disabled nil)

(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  (cond ((looking-at-p "\\s(")(funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list ))
	     (funcall fn )))))

(defun hidden-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (unless buffer-display-table
    (setq buffer-display-table (make-display-table)))
  (aset buffer-display-table ?\^M []))

(defun remove-dos-eol ()
  "Replace DOS eolns CR LF with Unix eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

(require 'dired-x)
(setq dired-dwim-target t)
(provide 'init-better-defaults)
