;;; init-yasnippet.el --- Configuraciones de Vertico y sus extensiones.
;; -*- lexical-binding: t -*-

;;; Commentary:
;;
;; Snippets y Plantillas de archivos

;;; Code:

(use-package yasnippet
  :diminish yas-minor-mode
  :hook (after-init . yas-global-mode)
  :config
  (yas-reload-all)
  (add-to-list 'yas-snippet-dirs "~/.config/emacs/snippets/"))

(use-package yasnippet-snippets
  :after yasnippet)

(provide 'init-yasnippet)
;;; init-yasnippet.el ends here
