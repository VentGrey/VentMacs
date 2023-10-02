;;; init-nerdicons.el --- Configuración de los nerdicons.
;; -*- lexical-binding: t -*-

;;; Commentary:
;;
;; Configuración para que se muestren nerd-icons en Emacs.

;;; Code:

(use-package nerd-icons
 :custom
 (nerd-icons-font-family "JetBrainsMono Nerd Font"))

(use-package nerd-icons-completion
  :config
  (nerd-icons-completion-mode))

(use-package nerd-icons-dired
  :hook
  (dired-mode . nerd-icons-dired-mode))

(provide 'init-nerdicons)
;;; init-nerdicons.el ends here
