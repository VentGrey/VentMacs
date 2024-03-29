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

(use-package grip-mode
  :ensure t
  :bind (:map markdown-mode-command-map
              ("g" . grip-mode))
  :config
  (setq grip-binary-path "~/.local/bin/grip"
        grip-url-browser "firefox"))

(provide 'init-markdown)
;;; init-markdown.el ends here
