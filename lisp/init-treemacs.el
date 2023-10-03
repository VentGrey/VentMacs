;;; init-treemacs.el --- Configuraciones propias de treemacs.
;; -*- lexical-binding: t -*-

;;; Commentary:
;;
;; Configuración sensible para que treemacs imite los exploradores de archivos
;; de editores modernos.

;;; Code:

(use-package treemacs
  :defer t
  :config
  (setq treemacs-follow-after-init t
        treemacs-is-never-other-window t
        treemacs-sorting 'alphabetic-case-insensitive-asc
        treemacs-recenter-after-file-follow t
        treemacs-width 40
        treemacs-collapse-dirs (if treemacs-python-executable 3 0)
        treemacs-deferred-git-apply-delay 0.5
        treemacs-filewatch-mode t)
  :commands
  (treemacs-follow-mode
   treemacs-filewatch-mode
   treemacs-git-mode))

(with-eval-after-load 'treemacs
  (define-key treemacs-mode-map [mouse-1] #'treemacs-single-click-expand-action))

;; Other treemacs configurations

(use-package treemacs-projectile
  :after treemacs)

(use-package treemacs-nerd-icons
  :after treemacs
  :custom-face
    (treemacs-nerd-icons-root-face ((t (:inherit nerd-icons-yellow :height 1.3))))
    (treemacs-nerd-icons-file-face ((t (:inherit nerd-icons-blue-alt))))
  :config
  (treemacs-load-theme "nerd-icons"))

(use-package treemacs-evil
  :after (treemacs evil)
  :ensure t)

(provide 'init-treemacs)
;;; init-treemacs.el ends here
