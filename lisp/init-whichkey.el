;;; init-whichkey.el --- Configuraciones del paquete whichkey.
;; -*- lexical-binding: t -*-

;;; Commentary:
;;
;; Configuraciones del paquete whichkey

;;; Code:
(use-package which-key
  :diminish
  :config
  (setq which-key-side-window-location 'bottom
		which-key-sort-order #'which-key-key-order-alpha
		which-key-sort-uppercase-first nil
		which-key-add-column-padding 1
		which-key-max-display-columns nil
		which-key-min-display-lines 6
		which-key-side-window-slot -10
		which-key-side-window-max-height 0.25
		which-key-idle-delay 0.8
		which-key-max-description-length 50
		which-key-allow-imprecise-window-fit t
		which-key-separator " ➔ ")
  (which-key-mode 1))

(provide 'init-whichkey)
;;; init-whichkey.el ends here
