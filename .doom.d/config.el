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
(setq doom-font (font-spec :family "JetBrains Mono" :size 14))

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

;; Usar F3 para abrir Treemacs igual que NERDTree en Vim
(global-set-key [f3] 'treemacs)

;; -------- Poner paréntesis de colores bonitos
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; -------- Ponerle el banner más perrón de la historia a Doom Emacs
(setq +doom-dashboard-banner-file (expand-file-name "banner.png" doom-private-dir))

;; ------- Llamar el CargoMode cuando abramos un archivo de Rust
(add-hook! 'rust-mode-hook 'cargo-minor-mode)

;; Una terminal bien perrona que no estorbe pls
(add-hook 'eshell-mode-hook #'hide-mode-line-mode)

;; Ivy con iconitos por si la cagamos
(setq +ivy-buffer-icons t)

;; IVY YASNIPPET que alch no se que hace :V
(after! ivy
(use-package! ivy-yasnippet
  :commands (ivy-yasnippet)
  :config
  (map!
   (:leader
     (:prefix "s"
       :desc "Ivy-yasnippet" :n "y" #'ivy-yasnippet)))))


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
  (setq lsp-julia-default-environment "~/.julia/environments/v1.4"))

;; ===== PYTHON
;; ------ Configuración para el lenguaje que menos tolero
(setq python-shell-interpreter "python3"
    flycheck-python-pycompile-executable "python3")

;; ===== RUST
;; SI ESTÁS USANDO ESTO, CAMBIA LAS RUTAS A TU NOMBRE DE
;; USUARIO, NO SEAS GIL
(with-eval-after-load 'rust-mode
(setq flycheck-rust-cargo-executable "/home/omar/.cargo/bin/")
(setq flycheck-rust-executable "/home/omar/.cargo/bin/rustc")
(setq +rust-src-dir "~/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"))

;; ===== C/C++
(add-hook 'c-mode-local-vars-hook #'lsp!)
(add-hook 'c++-mode-local-vars-hook #'lsp!)


;; ===== TUNEAME LA MODELINE =====
;; --- Poner nombres largos o pequeños dependiendo de la ruta
(setq doom-modeline-buffer-file-name-style 'auto)

;; --- Poner un iconito bien perrón dependiendo de lo que estemos editando
(setq doom-modeline-major-mode-icon t)

;; --- Colores para que la modeline se vea shido
(setq doom-modeline-major-mode-color-icon t)

;; --- Mostrar los modos menores en la modeline
(setq doom-modeline-minor-modes nil)

;; --- Mostrar un contador de palabras en el modeline
(setq doom-modeline-enable-word-count nil)

;; --- Mostrar la información de las sangrías
(setq doom-modeline-indent-info t)

;; --- Mostrar el ícono de los modos
(setq doom-modeline-modal-icon t)

;; --- Mostrar las notificaciones de gnus
(setq doom-modeline-gnus t)

;; --- Temporizador para actualizar los gnus
(setq doom-modeline-gnus-timer 2)

;; --- Mostrar la versión del entorno en el que trabajamos
(setq doom-modeline-env-version t)
