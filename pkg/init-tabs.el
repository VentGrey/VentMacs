;;; init-tabs.el --- Tabs para Emacs (Pestañas de editor moderno para Emacs).
;; -*- lexical-binding: t -*-

;;; Commentary:
;;
;; Configuración de tabs para tener pestañas modernas.

;;; Code:

(use-package awesome-tab
  :elpaca (:repo "https://github.com/manateelazycat/awesome-tab")
  :config
  (setq awesome-tab-height 80
        awesome-tab-display-icon nil)
  (awesome-tab-mode t))

(provide 'init-tabs)
;;; init-tabs.el ends here
