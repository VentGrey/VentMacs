;;; init-eglot.el --- Configuraciones de Eglot integrado en Emacs 29.1
;; -*- lexical-binding: t -*-

;;; Commentary:
;;
;; Configuraciones de eglot para Emacs.

;;; Code:

(use-package eglot)
(add-hook 'prog-mode-hook #'eglot-ensure)

(provide 'init-eglot)
;;; init-eglot.el ends here
