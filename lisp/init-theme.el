;;; init-theme.el --- Configuraciones del tema de spacemacs.
;; -*- lexical-binding: t -*-

;;; Commentary:
;;
;; Configuraciones del tema de spacemacs para Emacs.

;;; Code:

(use-package spacemacs-theme
  :demand t
  :init
  (setq spacemacs-theme-custom-colors
        '(
          (act1 . "#1A1728")
          (act2 . "#B4BEFE")
          (base . "#CDD6F4")
          (base-dim . "#BAC2DE")
          (bg1 . "#1E1E2E")
          (bg2 . "#181825")
          (bg3 . "#11111B")
          (bg4 . "#11111B")
          (border . "#45475A")
          (cblk . "#9399B2")
          (cblk-bg . "#181825")
          (cblk-ln . "#A6ADC8")
          (cblk-ln-bg . "#11111B")
          (cursor . "#BAC2DE")
          (const . "#CBA6F7")
          (comment . "#94E2D5")
          (comp . "#F5C2E7")
          (err . "#F38BA8")
          (func . "#CBA6F7")
          (head1 . "#89B4FA")
          (head2 . "#A6E3A1")
          (head3 . "#94E2D5")
          (head4 . "#F9E2AF")
          (highlight . "#444444")
          (highlight-dim . "#444444")
          (keyword . "#04a5e5")
          (lnum . "#585b70")
          (mat . "#a6d189")
          (meta . "#f2cdcd")
          (str . "#a6e3a1")
          (suc . "#a6d189")
          (ttip . "#6c6f85")
          (ttip-sl . "#4c4f69")
          (ttip-bg . "#444444")
          (type . "#e64553")
          (var . "#b4befe")
          (war . "#fab387")
          ))
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
