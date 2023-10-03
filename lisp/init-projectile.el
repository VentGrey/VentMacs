;;; init-projectile.el --- Configuraciones propias de projectile.
;; -*- lexical-binding: t -*-

;;; Commentary:
;;
;; Configuraciones propias de projectile

;;; Code:

(use-package projectile
  :ensure t
  :pin melpa-stable
  :init
  (projectile-mode 1))

(provide 'init-projectile)
;;; init-projectile.el ends here
