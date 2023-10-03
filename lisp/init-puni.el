;;; init-puni.el --- Maldita sea por fin algo para mantener consistencia entre símbolos de A/C.
;; -*- lexical-binding: t -*-

;;; Commentary:
;;
;; Manipulación de paréntesis y weas de cierre más fácil

;;; Code:

;; Use puni-mode globally and disable it for term-mode.
(use-package puni
  :defer t
  :config
  ;; The autoloads of Puni are set up so you can enable `puni-mode` or
  ;; `puni-global-mode` before `puni` is actually loaded. Only after you press
  ;; any key that calls Puni commands, it's loaded.
  (puni-global-mode)
  (add-hook 'term-mode-hook #'puni-disable-puni-mode))

(provide 'init-puni)
;;; init-puni.el ends here.
