;;; init.el --- VentMacs, un poco más que Emacs.
;; -*- lexical-binding: t -*-

;; Author: VentGrey <ventgrey@gmail.com>
;;; Commentary:
;;
;; Configuración de Emacs un poco más allá.

;;; Code:

;; No es necesario declarar que estamos usando UTF-8 en todos lados, esto lo hace
;; por nosotros. Sin embargo, también modifica la variable default-input-method
;; Por lo que debemos dejarla en "nil" de nuevo.
(set-language-environment "UTF-8")
(setq default-input-method nil)

;; No mostrar el banner de inicio de Emacs. Eso activa un modo que no queremos.
(setq-default inhibit-startup-message t)

;; Desactivar el plegado automático de mayúsculas y minúsculas en los nombres
;; de los modos de edición. Esto evita que el paso se haga dos veces y ahorramos
;; algo de tiempo.
(setq auto-mode-case-fold nil)

;; No renderizar cursores o regiones en ventanas de emacs que no tienen foco.
(setq-default cursor-in-non-selected-windows nil)
(setq highlight-nonselected-windows nil)

;; Hacer más rápido el scrolling en el buffer de Emacs, a costa de que
;; la sintáxis pueda verse rota. Esto se corrige solo y no es notorio en la gran
;; mayoría de casos (Salvo que te muevas muy velozmente en Emacs)
(setq fast-but-imprecise-scrolling t)

;; Emacs refresca su interfaz cada cierto tiempo. Aun así, ese tiempo es muy
;; poco, no es necesario ver los cambios cada 0.5 segundos
(setq idle-update-delay 1.0)

;; Incrementar cuanto se lee de los procesos en un solo pedazo (4kb por default)
(setq read-process-output-max (* 64 1024)) ; 64kb

;; Advertir cuando intentemos cargar un archivo mayor a 200MB
(setq large-file-warning-threshold 200000000)

;; Mejorar el renderizado, saltandonos la "fontification" cuando escribamos en un buffer
(setq redisplay-skip-fontification-on-input t)

;; Cambiar la capacidad del kill-ring
(setq kill-ring-max 128)

;; == NO EDITAR == Configuración de Elpaca
(defvar elpaca-installer-version 0.5)
(defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(defvar elpaca-repos-directory (expand-file-name "repos/" elpaca-directory))
(defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
                              :ref nil
                              :files (:defaults (:exclude "extensions"))
                              :build (:not elpaca--activate-package)))
(let* ((repo  (expand-file-name "elpaca/" elpaca-repos-directory))
       (build (expand-file-name "elpaca/" elpaca-builds-directory))
       (order (cdr elpaca-order))
       (default-directory repo))
  (add-to-list 'load-path (if (file-exists-p build) build repo))
  (unless (file-exists-p repo)
    (make-directory repo t)
    (when (< emacs-major-version 28) (require 'subr-x))
    (condition-case-unless-debug err
        (if-let ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
                 ((zerop (call-process "git" nil buffer t "clone"
                                       (plist-get order :repo) repo)))
                 ((zerop (call-process "git" nil buffer t "checkout"
                                       (or (plist-get order :ref) "--"))))
                 (emacs (concat invocation-directory invocation-name))
                 ((zerop (call-process emacs nil buffer nil "-Q" "-L" "." "--batch"
                                       "--eval" "(byte-recompile-directory \".\" 0 'force)")))
                 ((require 'elpaca))
                 ((elpaca-generate-autoloads "elpaca" repo)))
            (progn (message "%s" (buffer-string)) (kill-buffer buffer))
          (error "%s" (with-current-buffer buffer (buffer-string))))
      ((error) (warn "%s" err) (delete-directory repo 'recursive))))
  (unless (require 'elpaca-autoloads nil t)
    (require 'elpaca)
    (elpaca-generate-autoloads "elpaca" repo)
    (load "./elpaca-autoloads")))
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca `(,@elpaca-order))

;; Instalar soporte para use-package desde elpaca
(elpaca elpaca-use-package
  ;; Permitir el uso del comando :elpaca use-package
  (elpaca-use-package-mode)
  ;; Asumir siempre que queremos usar elpaca por encima de use-package de emacs
  (setq elpaca-use-package-by-default t))

;; Bloquear el hilo de ejecución hasta que terminen los procesos de elpaca
(elpaca-wait)

;; Cargar la configuración de Emacs de los siguientes directorios:
;; - PKG: Directorio de archivos de configuración de todos los paquetes de Emacs. Aquí están las configuraciones de cada paquete instalado.
;;
;; - SCRIPTS: Directorio de archivos de configuración de Emacs, aquí van las configuraciones propiamente de Emacs.

(add-to-list 'load-path "~/.config/emacs/pkg/")
(add-to-list 'load-path "~/.config/emacs/scripts/")

; === Interfaz de usuario
(require 'init-dashboard)
(require 'init-goldenratio)
(require 'init-modeline)
(require 'init-nerdicons)
(require 'init-tabs)
(require 'init-theme)

; === Control de Versiones
(require 'init-magit)

; === Emulación de Vim
(require 'init-evil)

; === Ayuda para aprender Emacs
(require 'init-whichkey)

; === ORG MODE
(require 'init-org)

; === REST API
(require 'init-rest)

; === Completado y correcciones
(require 'init-codeium)
(require 'init-company)
(require 'init-eglot)
(require 'init-flycheck)
(require 'init-vertico)
(require 'init-yasnippet)

; === Gestión de archivos y proyectos
(require 'init-projectile)
(require 'init-treemacs)

; === Contenedores
(require 'init-docker)

; === Modos o Lenguajes de Programación
(require 'init-c)
(require 'init-conf)
(require 'init-go)
(require 'init-hugo)
(require 'init-makefile)
(require 'init-markdown)
(require 'init-typescript)
(require 'init-web)

;; ===== PAQUETES TERMINAN AQUI ====
(require 'ui) ; Mejoras a la interfaz de usuario
(require 'editor) ; Ajustes sensibles de edición de textos
(require 'keybindings) ; Atajos de teclado
;;; init.el ends here
