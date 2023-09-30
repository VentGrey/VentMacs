;;; init-theme.el --- Configuraciones del tema de spacemacs.
;; -*- lexical-binding: t -*-

;;; Commentary:
;;
;; Configuraciones del tema de spacemacs para Emacs.

;;; Code:

(use-package spacemacs-theme
	     :demand t
	     :config
	     (setq spacemacs-theme-comment-italic t
		   spacemacs-theme-comment-bg nil
		   spacemacs-theme-org-bold t)
	     (load-theme 'spacemacs-dark t)
         (if (daemonp)
             (add-hook 'after-make-frame-functions #'load-spacemacs-theme)
           (load-theme 'spacemacs-dark t)))


(defun load-spacemacs-theme (frame)
  "Obtiene un FRAME y si ventana cliente del demonio de Emacs, lo carga."
  (select-frame frame)
  (load-theme 'spacemacs-dark t))

(provide 'init-theme)
;;; init-theme.el ends here
