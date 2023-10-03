;;; init-makefile.el --- Mejoras en las Makefiles.
;; -*- lexical-binding: t -*-

;;; Commentary:
;;
;; Paquetes para mejorar la experiencia de Makefiles

;;; Code:

(use-package makefile-executor
  :defer t
  :config
  (add-hook 'makefile-mode-hook 'makefile-executor-mode))

(provide 'init-makefile)
;;; init-makefile.el ends here
