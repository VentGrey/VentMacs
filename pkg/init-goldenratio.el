;;; init-goldenratio.el --- Conviertete en usuario de SPIN con Emacs. Ft Jhonny Joestar.
;; -*- lexical-binding: t -*-

;;; Commentary
;;
;; La geometría sagrada de Emacs. Auto-resize de los buffers respetando la
;; proporcion aurea.

;;; Code:

(use-package golden-ratio
  :config
  (setq golden-ratio-auto-scale t)
  (golden-ratio-mode 1))

(provide 'init-goldenratio)
;;; init-goldenratio.el ends here
