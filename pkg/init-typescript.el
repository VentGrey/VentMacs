;;; init-typescript.el --- Configuración de TypeScript.
;; -*- lexical-binding: t -*-

;;; Commentary:
;;
;; Configuraciones de TypeScript.

;;; Code:
(use-package tide
  :ensure t
  :after (company flycheck)
  :hook ((typescript-ts-mode . tide-setup)
         (tsx-ts-mode . tide-setup)
         (typescript-ts-mode . tide-hl-identifier-mode)
         (before-save . tide-format-before-save)))

(provide 'init-typescript)
;;; init-typescript.el ends here
