;;; init-web.el --- Configuraciones para el web-mode de emacs
;; -*- lexical-binding: t -*-

;;; Commentary:
;;
;; Configuraciones para el modo web de Emacs.

;;; Code:

(use-package web-mode
  :config
  (setq web-mode-markup-indent-offset 4
	web-mode-css-indent-offset 4
	web-mode-code-indent-offset 4
	web-mode-comment-style 2
	web-mode-enable-auto-pairing t
	web-mode-enable-css-colorization t
    web-mode-enable-current-element-highlight t))

(use-package emmet-mode
  :after web)

(add-hook 'web-mode-hook 'emmet-mode)

(provide 'init-web)
;;; init-web.el ends here
