;;; init-evil.el --- Configuración de Evil.
;; -*- lexical-binding: t -*-

;;; Commentary:
;;
;; Configuraciones de Evil.

;;; Code:
(use-package evil
	     :demand t
	     :init
         ;; Tunear la configuración de evil antes de cargarlo
	     (setq evil-want-integration t
		   evil-want-keybinding nil
		   evil-vsplit-window-right t
		   evil-split-window-below t
           evil-undo-system 'undo-redo)
	     (evil-mode))

;; ==== EVIL Collection (Evil en todos perros lados) ====
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))
(setq evil-want-keybinding t)

(use-package general
  :after evil
  :config
  (general-evil-setup))

(provide 'init-evil)
;;; init-evil.el ends here
