(require 'org)
(require 'f)
(setq debug-on-error t)
(defun add-tangle-headers ()
    (message "adding tangle headers in %s" (buffer-file-name))
    (cond
     ((f-ext? (buffer-file-name) "el")
      (goto-char (point-min))
      (insert ";;; -*- lexical-binding: t -*-\n"))
     (t nil))
    (message "add-tangle-headers: saving buffer")
    (let ((buffer-save-without-query t)) (save-buffer))
    (message "add-tangle-headers: saved buffer"))

(add-hook 'org-babel-post-tangle-hook 'add-tangle-headers)
(message "tangle headers such as lexical binding after babel tangle")

;; TODO don't hardcode this m8
(org-babel-load-file "/home/cody/.emacs.d/readme.org")

(setq debug-on-error nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values
   '((eval add-hook 'after-save-hook
	   (lambda nil
	     (if
		 (y-or-n-p "Tangle?")
		 (org-babel-tangle)))
	   nil t)
     (eval add-hook 'after-save-hook
	   (lambda nil
	     (if
		 (y-or-n-p "Reload?")
		 (load-file user-init-file)))
	   nil t))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
