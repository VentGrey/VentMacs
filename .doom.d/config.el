;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Omar Jair Purata Funes"
      user-mail-address "omarpurataf@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq
 doom-font (font-spec :family "JetBrainsMono NF" :size 14)
 doom-variable-pitch-font (font-spec :family "JetBrainsMono NF")
 doom-unicode-font (font-spec :family "Fira Sans")
 doom-big-font (font-spec :family "JetBrainsMono NF" :size 18))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-monokai-pro)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.
;;
;;
;; === CONFIGURACIÓN PROPIA ===

;; ----- DOOM DASHBOARD CONFIGS -----
;; Configuración del dashboard de Doom

; Nombre en la barra de título del dasboard
(setq +doom-dashboard-name "*VentMacs*")
(setq frame-title-format '("" "[%b] - VentMacs " emacs-version))

; Logo personalizado localizado en .doom.d
(setq +doom-dashboard-banner-file (expand-file-name "banner.png" doom-private-dir))

;; ----- CONFIGURACIÓN DE LAS PESTAÑAS -----
(setq centaur-tabs-style "chamfer")
(setq centaur-tabs-set-bar 'over)

;; ----- Frases propias al salir de Emacs
(setq +doom-quit-messages '(;; Frases varias, algunas robadas, otras solo por hacerse el payaso.
                            "Escucha, yo no te agrado y ten seguro que tú no me agradas a mi!"
                            "¿Por qué no tomas una foto? Duran más..."
                            "Los bugs no se arreglarán solos ¿lo sabes?"
                            ))

;; ----- CONFIGURACIÓN DE TREEMACS
;; Usar F3 para abrir Treemacs igual que NERDTree en Vim
(global-set-key [f3] 'treemacs)
;; Mostrar íconos del LSP
(lsp-treemacs-sync-mode 1)

;; Activar meson para los proyectos que lo usen
(add-hook 'meson-mode-hook 'company-mode)

;; Dejar las gúias de sangría visibles para no cagarla con los espacios
(use-package! highlight-indent-guides
  :init
  (setq highlight-indent-guides-method 'character)
  :config
  (defun +indent-guides-init-faces-h ()
    (when (display-graphic-p)
      (highlight-indent-guides-auto-set-faces))))

;; -------- Poner paréntesis de colores bonitos
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; ------- Llamar el CargoMode cuando abramos un archivo de Rust
(add-hook! 'rust-mode-hook 'cargo-minor-mode)

;; Una terminal bien perrona que no estorbe pls
(add-hook 'eshell-mode-hook #'hide-mode-line-mode)

;; ===== Configuración de IVY

;; Ivy con íconos fresas
(all-the-icons-ivy-setup)
(use-package! all-the-icons-ivy
  :init (add-hook 'after-init-hook 'all-the-icons-ivy-setup))

;; Activar el wrapping de forma GLOBAL, así el código se escribe bien y bonito.
(+global-word-wrap-mode +1)



;; Revisar archivos minificados
(set-popup-rules! '(("^\\*helpful" :size 0.35)
                    ("^\\*Ibuffer\\*$" :size 0.35)
                    ("^\\*info.*" :size 80 :side right)
                    ("^\\*Man.*" :size 80 :side right)
                    ("^\\*Customize" :actions display-buffer)
                    ("^\\*edit-indirect" :size 0.6)
                    ("^\\*YASnippet Tables\\*$" :size 0.35)
                    ("^\\*grep\\*$" :size 0.35)
                    ("^\\*pytest\\*" :size 0.35)
                    ("^\\*Anaconda\\*$" :size 0.35)
                    ("\\*.*server log\\*$" :side top :size 0.20 :select nil)
                    ((lambda (buf _) (with-current-buffer buf (eq major-mode 'forge-topic-mode))) :size 0.35)
                    ))

;; ===== Configuración global del LSP (Language Server Protocol)

(after! lsp-mode
  (setq lsp-log-io nil)
  (dolist (dir '("[/\\\\]\\.ccls-cache$"
                 "[/\\\\]\\.mypy_cache$"
                 "[/\\\\]\\.pytest_cache$"
                 "[/\\\\]\\.cache$"
                 "[/\\\\]\\.clwb$"
                 "[/\\\\]_build$"
                 "[/\\\\]__pycache__$"
                 "[/\\\\]bazel-bin$"
                 "[/\\\\]bazel-code$"
                 "[/\\\\]bazel-genfiles$"
                 "[/\\\\]bazel-out$"
                 "[/\\\\]bazel-testlogs$"
                 "[/\\\\]third_party$"
                 "[/\\\\]third-party$"
                 ))
    (push dir lsp-file-watch-ignored-directories))
  )

;; ===== CONFIGURACIONES DE ORGMODE =====
(after! org
  (add-hook! 'org-mode-hook (lambda () (org-bullets-mode 1)))
  (setq org-ellipsis " ▼ "))


;; ===== CONFIGURACIONES DE LOS LENGUAJES =====

;; ===== LATEX
;; LaTeX para los machos que son realmente machos y no usan Word o PowerPoint
(setq-hook! 'LaTeX-mode-hook +spellcheck-immediately nil)
(setq-hook! 'org-mode-hook +spellcheck-immediately nil)

;; ===== JULIA
;; El LSP de Julia que jala en Emacs cuando quiere
(add-hook 'julia-mode-local-vars-hook #'lsp!)
(add-hook 'ess-julia-mode-hook #'lsp-mode)
(use-package lsp-julia
  :config
  (setq lsp-julia-default-environment "~/.julia/environments/v1.5"))

;; ===== PYTHON
;; ------ Configuración para el lenguaje que menos tolero
(after! python
  (setq python-indent-offset 4
        python-shell-interpreter "python3"
        flycheck-python-pylint-executable "pylint"
        flycheck-python-flake8-executable "flake8"))

(after! pipenv
  (setq pipenv-with-projectile t)
  (defun pipenv--clean-response (response)
    "Clean up RESPONSE from shell command."
    (replace-regexp-in-string "\n\\[0m$" "" (s-chomp response)))

  (dolist (func '(pipenv-activate pipenv-deactivate))
    (advice-add func :after #'reset-flycheck)))

;; ===== C/C++
(add-hook! 'c-mode-hook 'lsp)
(add-hook! 'cpp-mode-hook 'lsp)

; Configuraciones de clangd
(setq lsp-clients-clangd-args '("-j=8"
                                "--background-index"
                                "--clang-tidy"
                                "--completion-style=detailed"
                                "--header-insertion=never"))
(after! lsp-clangd (set-lsp-priority! 'clangd 2))
; Estilo del código del kernel linux. Así se programa C, así se debe de programar siempre
(add-hook! 'c-mode-common-hook
          '(lambda ()
             (c-set-style "linux")))

;; ===== SHELL
(after! sh-script
  (set-company-backend! 'sh-mode
    '(company-shell :with company-yasnippet)))

;; ===== TERMINAL
(set-formatter! 'shfmt "shfmt -i=2")

(after! eshell
  ;; eshell-mode imenu index
  (add-hook! 'eshell-mode-hook (setq-local imenu-generic-expression '(("Prompt" " λ \\(.*\\)" 1))))

  (defun eshell/l (&rest args) (eshell/ls "-l" args))
  (defun eshell/e (file) (find-file file))
  (defun eshell/md (dir) (eshell/mkdir dir) (eshell/cd dir))
  (defun eshell/ft (&optional arg) (treemacs arg))

  (defun eshell/up (&optional pattern)
    (let ((p (locate-dominating-file
              (f-parent default-directory)
              (lambda (p)
                (if pattern
                    (string-match-p pattern (f-base p))
                  t)))
             ))
      (eshell/pushd p)))
  )

(after! term
  ;; term-mode imenu index
  (add-hook! 'term-mode-hook (setq-local imenu-generic-expression '(("Prompt" "➜\\(.*\\)" 1)))))

;; ===== TUNEAME LA MODELINE =====
;; --- Poner nombres largos o pequeños dependiendo de la ruta
(setq! doom-modeline-buffer-file-name-style 'auto)

;; --- Detectar el root de los proyectos
(setq! doom-modeline-project-detection 'projectile)

;; --- Poner un iconito bien perrón dependiendo de lo que estemos editando
(setq! doom-modeline-major-mode-icon t)

;; --- Colores para que la modeline se vea shido
(setq! doom-modeline-major-mode-color-icon t)

;; --- Modificaciones de los íconos
(setq! doom-modeline-buffer-modification-icon t)

;; --- Mostrar los modos menores en la modeline
(setq! doom-modeline-minor-modes nil)

;; --- Mostrar un contador de palabras en el modeline
(setq! doom-modeline-enable-word-count nil)

;; --- Mostrar la información de las sangrías
(setq! doom-modeline-indent-info t)

;; --- Mostrar el ícono de los modos
(setq! doom-modeline-modal-icon t)

;; --- Mostrar las notificaciones de gnus
(setq! doom-modeline-gnus t)

;; --- Temporizador para actualizar los gnus
(setq! doom-modeline-gnus-timer 2)

;; --- Mostrar la versión del entorno en el que trabajamos
(setq! doom-modeline-env-version t)
