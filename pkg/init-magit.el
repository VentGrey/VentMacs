;;; init-magit.el --- Configuraciones de Magit
;; -*- lexical-binding: t -*-

;;; Commentary:
;;
;; Configuraciones de Magit para Emacs.

;;; Code:

(use-package magit
  :defer t)

(use-package git-gutter+
  :config
  (global-git-gutter+-mode)
  (add-hook 'prog-mode-hook 'git-gutter+-mode))

(use-package git-modes
  :after magit)

(provide 'init-magit)
;;; init-magit.el ends here
