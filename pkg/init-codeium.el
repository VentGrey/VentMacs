;;; init-codeium.el --- Autocompletado con IA para Emacs.
;; -*- lexical-binding: t -*-

;;; Commentary:
;;
;; Configuración de codeium para tener completado tipo Copilot
;; (pero gratis) de IA en Emacs.

;;; Code:

(use-package codeium
  :elpaca (:repo "https://github.com/Exafunction/codeium.el")
  :init
      (add-to-list 'completion-at-point-functions #'codeium-completion-at-point)
  :defer t)

(provide 'init-codeium)
;;; init-codeium.el ends here
