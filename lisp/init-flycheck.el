;;; init-flycheck.el --- Configuraciones de Flycheck para Emacs.
;; -*- lexical-binding: t -*-

;;; Commentary:
;;
;; Configuraciones de Flycheck para Emacs.

;;; Code:

(use-package flycheck
  :ensure t
  :defer t
  :diminish
  :init (global-flycheck-mode))

(use-package flycheck-eglot
  :ensure t
  :after (flycheck eglot)
  :config
  (global-flycheck-eglot-mode 1))

(use-package flycheck-inline
  :after flycheck
  :demand t
  :init
  (add-hook 'flycheck-mode-hook #'turn-on-flycheck-inline))

(provide 'init-flycheck)
;;; init-flycheck.el ends here
