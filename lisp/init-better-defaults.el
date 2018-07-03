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

(provide 'init-better-defaults)
