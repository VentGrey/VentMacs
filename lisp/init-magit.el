;;; init-magit.el --- Configuraciones de Magit
;; -*- lexical-binding: t -*-

;;; Commentary:
;;
;; Configuraciones de Magit para Emacs.

;;; Code:

(use-package magit
  :defer t)

(use-package git-gutter
  :hook (prog-mode . git-gutter-mode)
  :config
  (setq git-gutter:update-interval 1.5))

(use-package git-modes
  :after magit)

(provide 'init-magit)
;;; init-magit.el ends here
