;;; init-vertico.el --- Configuraciones de Vertico y sus extensiones.
;; -*- lexical-binding: t -*-

;;; Commentary:
;;
;; Configuraciones para Vertico y sus extensiones.

;;; Code:

(use-package vertico
	     :ensure t
	     :custom
	     (vertico-cycle t)
	     :init
	     (vertico-mode))

(use-package marginalia
	     :after vertico
	     :ensure t
	     :custom
	     (marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
	     :init
	     (marginalia-mode))

(provide 'init-vertico)
;;; init-vertico.el ends here
