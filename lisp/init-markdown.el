;;; init-markdown.el --- Configuración de Markdown para Emacs.
;; -*- lexical-binding: t -*-

;;; Commentary:
;;
;; Configuración de Markdown para Emacs.

;;; Code:

(use-package markdown-mode
  :mode (("README\\.md\\'" . gfm-mode))
  :custom
  (markdown-command "/usr/bin/pandoc"))

(provide 'init-markdown)
;;; init-markdown.el ends here
