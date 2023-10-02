;;; init-go.el --- Configuración de Go para Emacs.
;; -*- lexical-binding: t -*-

;;; Commentary:
;;
;; Configuración de Go para Emacs.

;;; Code:

(use-package go-mode
  :defer t)

;; Offsets de sangría para los modos de tree-sitter
(defun go-treesit-config ()
  "Configuration function for \"go-ts-mode\"."
  (setq-local go-ts-mode-indent-offset 4)
  ;; Insert other configuration options here
)

(defun go-normal-config ()
  "Configuration function for \"go-mode\"."
  (setq-local go-mode-indent-offset 4)
  ;; Insert other configuration options here
)

(add-hook 'go-ts-mode-hook 'go-treesit-config)
(add-hook 'go-mode-hook 'go-normal-connfig)


(provide 'init-go)
;;; init-go.el ends here
