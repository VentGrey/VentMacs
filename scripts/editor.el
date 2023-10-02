;;; editor.el --- Configuraciones propias de edición de textos.
;; -*- lexical-binding: t -*-

;;; Commentary:
;;
;; Configuraciones propias de edición de textos

;;; Code:

;; No mantener una versión anterior del código si el archivo se actualiza,
;; mostrar en el buffer el archivo actualizado
(global-auto-revert-mode t)
(setq load-prefer-newer t)

;; Guardar la localización del cursor en los archivos abiertos
(save-place-mode 1)
(setq save-place-file (locate-user-emacs-file "places" ".emacs-places"))

;; Insertar espacios en lugar de tabulaciones
(setq-default c-basic-offset 4
              tab-width 4
              indent-tabs-mode nil)

;; Autocompletar paréntesis en todos los buffers
(electric-pair-mode 1)

;; Electric indent es una mierda, pero con esto podemos decirle que le baje de huevos con nuestros buffers
(setq electric-indent-inhibit t)

;; Cuando querramos borrar hacia atrás, borrar todo alv, sean espacios o tabs, no espacio por espacio
(setq backward-delete-char-untabify-method 'hungry)


;; Cuando salgamos de emacs, no preguntar por los procesos que están en el fondo
(setq confirm-kill-processes nil)

;; Solamente ciclar el autocompletado con TAB si hay pocos candidatos del mismo
(setq completion-cycle-threshold 3)

;; Eliminar el texto seleccionado en lugar de sobreescribir por encima
(delete-selection-mode 1)

;; Guardar el historial de comandos de M-x
(savehist-mode 1)
(setq history-length 1000)

;; No crear lockfile
(setq create-lockfiles nil)

;; Eliminar las advertencias castrosas de los paquetes
(setq warning-minimum-level :error)

;; Permitir minibuffers en los minibuffers
(setq enable-recursive-minibuffers t)

;; Deshabilitar la cache de URL's
(setq url-automatic-caching nil)

;; Permitir respuestas con y/n para no escribir como pendejos todo el "yes" o "no"
(setq use-short-answers t)

;; Re-mapear los modos normales de emacs a los modos especiales de tree-sitter. Esto para los lenguajes de programación que usaremos en esta configuración de Emacs.
(setq major-mode-remap-alist
      '(
        (python-mode . python-ts-mode)
        (go-mode . go-ts-mode)
        (sh-mode . bash-ts-mode)
        (c-mode . c-ts-mode)
        (c++-mode . c++-ts-mode)
        (css-mode . css-ts-mode)
        (html-mode . html-ts-mode)
        (js-mode . js-ts-mode)
        (js-json-mode . json-ts-mode)
        ))
(provide 'editor)
;;; editor.el ends here
