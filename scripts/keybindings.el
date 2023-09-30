;;; keybindings.el --- Atajos de teclado para esta configuración de Emacs.
;; -*- lexical-binding: t -*-

;;; Commentary:
;;
;; Atajos de teclado de VentMacs

;;; Code:

;; Treemacs
(global-set-key [f3] 'treemacs)

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
 "fo" '(counsel-find-file :which-key "abrir archivo")

 )


;; Tabs
(with-eval-after-load 'evil
  (evil-define-key 'normal 'global
    ;; Navegación entre pestañas
    "gt" 'awesome-tab-forward-tab
    "gT" 'awesome-tab-backward-tab
    "g0" 'awesome-tab-select-beg-tab
    "g$" 'awesome-tab-select-end-tab

    ;; Navegación entre grupos de pestañas
    "g>" 'awesome-tab-forward-group
    "g<" 'awesome-tab-backward-group

    ;; Movimiento de pestañas dentro del grupo
    "gh" 'awesome-tab-move-current-tab-to-left
    "gl" 'awesome-tab-move-current-tab-to-right
    "gH" 'awesome-tab-move-current-tab-to-beg

    ;; Acciones sobre las pestañas
    "gk" 'awesome-tab-kill-other-buffers-in-current-group
    "gK" 'awesome-tab-kill-all-buffers-in-current-group
    "gm" 'awesome-tab-kill-match-buffers-in-current-group
    "gM" 'awesome-tab-keep-match-buffers-in-current-group

    ;; Acciones adicionales
    "gs" 'awesome-tab-switch-group
    "ga" 'awesome-tab-ace-jump
    )

  ;; Navegación en otras ventanas (combinaciones con C-w)
  (evil-define-key 'normal 'global
    (kbd "C-w gt") 'awesome-tab-forward-tab-other-window
    (kbd "C-w gT") 'awesome-tab-backward-tab-other-window
    )
  )

(provide 'keybindings)
;;; keybindings.el ends here

