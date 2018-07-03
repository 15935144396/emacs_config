(package-initialize)
(add-to-list 'load-path  "/Users/fengwenwei/.emacs.d/lisp/")


(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))



(require 'init-better-defaults)
(require 'init-packages)
(require 'init-ui)
(require 'init-org)
(require 'init-keybind)
 
(setq custom-file  (expand-file-name "lisp/custome.el" user-emacs-directory))
(load-file custom-file)






