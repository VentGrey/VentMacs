;;; early-init.el --- Inicialización temprana de Emacs.
;; -*- lexical-binding: t -*-

;;; Commentary:
;;
;; Configuraciones para ejecutar antes de que se cargue el archivo init.el

;;; Code:

;; Deshabilitar el gestor de paquetes interno de Emacs en favor de elpaca
(setq package-enable-at-startup nil)
(setq inhibit-default-init nil)

;; Deshabilitar las advertencias de native-comp.
(setq native-comp-async-report-warnings-errors nil)

;; No recolectar basura durante el inicio de Emacs.
;; Tomado y modificado de: https://github.com/progfolio/.emacs.d
(setq gc-cons-percentage 1
      gc-cons-threshold most-positive-fixnum)

(setq read-process-output-max (* 4 1024 1024))

;; Creamos una variable para guardar el valor original de `file-name-handler-alist`.
(defvar my-original-file-name-handler-alist file-name-handler-alist
  "Copia de seguridad del valor original de `file-name-handler-alist`.")

;; Recolectar basura cuando el foco no se encuentre en Emacs
(defun +gc-after-focus-change ()
  "Run GC when frame loses focus."
  (run-with-idle-timer
   5 nil
   (lambda () (unless (frame-focus-state) (garbage-collect)))))

(defun +reset-init-values ()
  "Reset initial GC values."
  (run-with-idle-timer
   1 nil
   (lambda ()
     ;; Restore the file-name-handler-alist
     (setq file-name-handler-alist my-original-file-name-handler-alist
           gc-cons-percentage 0.1
           gc-cons-threshold 100000000)
     (message "gc-cons-threshold & file-name-handler-alist restored")
     (when (boundp 'after-focus-change-function)
       (add-function :after after-focus-change-function #'+gc-after-focus-change)))))

(with-eval-after-load 'elpaca
  (add-hook 'elpaca-after-init-hook '+reset-init-values))

;; Esto no va a funcionar en Windows. Igual no lo vale ese SO.
(when (eq system-type 'windows-nt)
  (error "VentMacs no es (ni será) compatible con Windows"))

;; Verificar la versión de Emacs. Debe ser la versión 29.1 o superior por el uso de tree-sitter y eglot interno
(let* ((minver "29.1"))
  (when (version< emacs-version minver)
    (error "Emacs v%s o superior es necesario para ejecutar VentMacs" minver)))

;; Quitar las barras no deseadas de la UI. Doom Emacs tiene este hack donde
;; podemos quitarlas antes de que se activen sus respectivos modos y ahorrar
;; algo de tiempo en redeclarar variables. Lo ponemos en el early-init.el
;; para que sea lo primero que se quite de nuestra vista.
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)
(when (featurep 'ns)
  (push '(ns-transparent-titlebar . t) default-frame-alist))
(setq-default mode-line-format nil)

;; Desactivar el redimensionado del marco
(setq frame-inhibit-implied-resize t)

(provide 'early-init)
;;; early-init.el ends here
