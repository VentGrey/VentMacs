;;; init-keybindings.el --- Atajos de teclado para esta configuración de Emacs.
;; -*- lexical-binding: t -*-

;;; Commentary:
;;
;; Atajos de teclado de VentMacs

;;; Code:

;; Treemacs
(global-set-key [f3] 'treemacs)

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

(provide 'init-keybindings)
;;; init-keybindings.el ends here

