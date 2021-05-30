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
(setq doom-theme 'doom-one)

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


;; ----- EMACS CORE CONFIGS & HACKS -----
;; Configuraciones de emacs como tal y algunos hacks para
;; mejorar la experiencia del usuario



;; ==== Configuración de tarjeta gráfica ====
;; Las tarjetas gráficas con VSYNC generan pedos
;; esto debería arreglar el acartonamiento de emacs
(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))

;; == HACK: Scrolling mejorado ==
;; Manejar archivos HTML, JSON o muy grandes en general resulta en un scroll
;; impreciso de emacs, esto podría arreglarlo de cierta forma.

;; redibujar inmediatamente al hacer scrolling.
(setq jit-lock-defer-time 0
      fast-but-imprecise-scrolling t
      ;; No acelerar el scroll con el mouse
      mouse-wheel-scroll-amount '(2 ((shift) . 1))
      mouse-wheel-progressive-speed nil
      ;; Margenes y límites del scrolling un poco mejores que los default
      scroll-margin 0
      scroll-conservatively 101
      scroll-preserve-screen-position t
      auto-window-vscroll nil)

;; ---- CONFIGURACIONES ESPECIALES DE ARCHIVOS -----
;; Insertar espacios en lugar de tabulaciones. La definición está por algo
(setq-default indent-tabs-mode nil)

;; ----- DOOM DASHBOARD CONFIGS -----
;; Configuración del dashboard de Doom

; Nombre en la barra de título del dasboard
(setq +doom-dashboard-name "*VentMacs*")
(setq frame-title-format '("" "[%b] - VentMacs " emacs-version))

; Logo personalizado localizado en .doom.d
(setq +doom-dashboard-banner-file (expand-file-name "banner.png" doom-private-dir))

; Footer personalizado
(add-hook! '+doom-dashboard-functions :append
           (insert "\n" (+doom-dashboard--center +doom-dashboard--width "Based on Doom Emacs!  ")))

; Entradas del menu
(assoc-delete-all "Jump to bookmark" +doom-dashboard-menu-sections)
(assoc-delete-all "Open org-agenda" +doom-dashboard-menu-sections)


;; ----- CONFIGURACIÓN DE LAS PESTAÑAS -----
(setq! centaur-tabs-style "chamfer")
(setq! centaur-tabs-set-bar 'over)

;; ----- CONFIGURACIÓN DE TREEMACS
;; Usar F3 para abrir Treemacs igual que NERDTree en Vim
(global-set-key [f3] 'treemacs)
;; Mostrar íconos del LSP
(lsp-treemacs-sync-mode 1)
;; Personalización variada de emacs
(setq treemacs-indentation-string (propertize " ⫶ " 'face 'font-lock-comment-face)
      treemacs-indentation 1)

;; Activar meson para los proyectos que lo usen
(add-hook! 'meson-mode-hook 'company-mode)

;; Dejar las gúias de sangría visibles para no cagarla con los espacios
(use-package! highlight-indent-guides
  :defer t
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

;; ===== Configuración de IVY

;; Ivy con íconos fresas
(all-the-icons-ivy-setup)
(use-package! all-the-icons-ivy
  :init (add-hook 'after-init-hook 'all-the-icons-ivy-setup))

;; Activar el wrapping de forma GLOBAL, así el código se escribe bien y bonito.
(+global-word-wrap-mode +1)

;; ===== CONFIGURACIONES DE ORGMODE =====
(after! org
  (add-hook! 'org-mode-hook (lambda () (org-bullets-mode 1)))
  (setq org-ellipsis " ▼ "))


;; ===== CONFIGURACIONES DE LOS LENGUAJES =====

;; ===== LATEX
;; LaTeX para los machos que son realmente machos y no usan Word o PowerPoint
(setq-hook! 'LaTeX-mode-hook +spellcheck-immediately nil)
(setq-hook! 'org-mode-hook +spellcheck-immediately nil)

;; ===== PYTHON
;; ------ Configuración para el lenguaje que menos tolero
(after! python
  (setq python-indent-offset 4
        python-shell-interpreter "/usr/bin/python3"
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

; Estilo del código del kernel linux. Así se programa C,
; así se debe de programar siempre
(add-hook! cc-mode
  (setq! c-default-style "linux"))

; Configuración de CCLS
(after! ccls
  (setq ccls-initialization-options '(
                                      :index (:comments 2)
                                      :completion (:detailedLabel t))))

;; ===== Web
;; Sangrías para los diferentes lenguajes web

(after! web
  (setq web-mode-markup-indent-offset 2
      web-mode-css-indent-offset 4
      web-mode-code-indent-offset 4
      web-mode-style-padding 4
      web-mode-script-padding 4
      web-mode-block-padding 0))


;; Configuraciones para CSS y SASS
(use-package! css-mode
  :init (setq css-indent-offset 4))

;; Usar el `less-css-mde' que está presente desde Emacs 26
(unless (fboundp 'less-css-mode)
  (use-package! less-css-mode))

;; ===== TUNEAME LA MODELINE =====
(setq doom-modeline-buffer-file-name-style 'auto
      doom-modeline-icon (display-graphic-p)
      doom-modeline-major-mode-icon t
      doom-modeline-major-mode-color-icon t
      doom-modeline-buffer-modification-icon t
      doom-modeline-minor-modes nil
      doom-modeline-enable-word-count nil
      doom-modeline-indent-info t
      doom-modeline-modal-icon t
      doom-modeline-env-version t
      doom-modeline-env-load-string ""
       )
