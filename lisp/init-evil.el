;;; init-evil.el --- Configuración de Evil.
;; -*- lexical-binding: t -*-

;;; Commentary:
;;
;; Configuraciones de Evil.

;;; Code:
(use-package evil
  :demand t
  :preface (setq evil-want-keybinding nil)
  :config
  ;; Tunear la configuración de evil antes de cargarlo
  (setq evil-want-integration t
		evil-vsplit-window-right t
		evil-split-window-below t
        evil-want-keybinding t
        evil-undo-system 'undo-redo)
  (evil-mode))

;; ==== EVIL Collection (Evil en todos perros lados) ====
(use-package evil-collection
  :config
  (evil-collection-init))

(use-package general
  :config
  (general-evil-setup)

  ;; Definición del prefijo global
  (general-create-definer ventmacs-leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC")

  ;; Keybindings generales con general.el y which-key
  (ventmacs-leader-keys

   ;; Abrir treemacs
   "t" '(treemacs :which-key "Abrir Treemacs")

   ;; Compilación
   "c" '(:ignore t :which-key "Compilación")
   "cc" '(compile :which-key "Compilar (usando la orden de Emacs)")
   "cr" '(recompile :which-key "Recompilar (usando la orfen de Emacs)")

   ;; REST API Client
   "r" '(restclient-http-send-current :which-key "Enviar request usando RESTCLient")

   ;; eglot
   "e" '(eglot :which-key "Activar eglot")

   ;; Magit
   "g" '(:ignore t :which-key "git")
   "gg" '(magit :which-key "Abrir magit")
   "ga" '(magit-add :which-key "Añadir archivos")
   "gs" '(magit-status :which-key "Estado magit")
   "gc" '(magit-commit :which-key "Hacer commit")
 
   ;; Makefile
   "m" '(:ignore t :which-key "makefile")
   "mm" '(makefile-executor-execute-project-target :which-key "Ejecutar Makefile")
   "mf" '(makefile-executor-execute-target :which-key "Ejecutar un target en el Makefile")

   ;; Documentación
   "d" '(:ignore t :which-key "Documentación")
   "dm" '(lambda () (interactive) (find-file "~/.config/emacs/docs/manual.org") :which-key "Abrir manual de VentMacs")

   ;; Ventanas y Buffers
   "w" '(:ignore t :which-key "Ventanas y Buffers")
   "wb" '(switch-to-buffer :which-key "Cambiar buffer")
   "wd" '(delete-window :which-key "Eliminar ventana")
   "ws" '(split-window-below :which-key "Dividir horizontal")
   "wv" '(split-window-right :which-key "Dividir vertical")

   ;; Archivos
   "f" '(:ignore t :which-key "archivos")
   "fs" '(save-buffer :which-key "guardar archivo")
   )
  )

(provide 'init-evil)
;;; init-evil.el ends here
