;;; init-ui.el --- Configuraciones de interfaz de usuario de Emacs.
;; -*- lexical-binding: t -*-

;;; Commentary:
;;
;; Configuraciones de interfaz de usuario de Emacs.

;;; Code:

;; Mostrar los números de línea en todos los buffers editables
(global-display-line-numbers-mode 1)
(global-visual-line-mode t)

;; La regla sagrada de las 80 columnas surge de las tarjetas perforadas de IBM
;; dicha regla luego pasó a las terminales ANSI con medidas de 80x24 para
;; mantener un aspect ratio de 4:3. Aquí nos gusta eso.
(setq-default fill-column 80)
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)

;; Mostrar un título de ventana personalizado con el formato:
;; [nombre del archivo] - VentMacs <versión de emacs>
(setq frame-title-format '("" "[%b] - VentMacs " emacs-version))

;; Quitar las barras no deseadas de la UI. Doom Emacs tiene este hack donde
;; podemos quitarlas antes de que se activen sus respectivos modos y ahorrar
;; algo de tiempo en redeclarar variables
(push '(vertical-scroll-bars) default-frame-alist)
(setq menu-bar-mode nil
      tool-bar-mode nil
      scroll-bar-mode nil)

;; Resaltar la línea que estamos editando
(global-hl-line-mode t)

;; Elegir la fuente por defecto como JetBrainsMono
(set-face-attribute 'default nil
		    :font "JetBrainsMono Nerd Font Mono"
		    :height 100
		    :weight 'light)

(set-face-attribute 'variable-pitch nil
		    :font "Clear Sans Light"
		    :height 110
		    :weight 'light)

(set-face-attribute 'fixed-pitch nil
		    :font "JetBrainsMono Nerd Font Mono"
		    :height 100
		    :weight 'light)

;; Marcar los comentarios y las palabras clave con formato italic
(set-face-attribute 'font-lock-comment-face nil
		    :slant 'italic)
(set-face-attribute 'font-lock-keyword-face nil
		    :slant 'italic)

;; El espaciado entre líneas de Emacs no está tan chido. Vamos a arreglarlo
;; con esto.
(setq-default line-spacing 0.12)

;; No utilizar el file-picker del sistema operativo ni los diálogos.
(setq use-file-dialog nil
      use-dialog-box nil)

;; No mostrar nada en el buffer inicial de emacs
(setq initial-scratch-message nil)

;; No utilizar tooltips de Gtk+
(when (boundp 'x-gtk-use-system-tooltips)
  (setq x-gtk-use-system-tooltips nil))

;; Mejorar el scroll a algo más "suave"
(setq scroll-conservatively most-positive-fixnum
      scroll-margin 0
      scroll-preserve-screen-position 1)

(provide 'init-ui)
;;; init-ui.el ends here
