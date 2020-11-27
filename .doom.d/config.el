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
(setq doom-theme 'spacemacs-dark)

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

; Logo personalizado localizado en .doom.d
(setq +doom-dashboard-banner-file (expand-file-name "banner.png" doom-private-dir))

;; ----- CONFIGURACIÓN DE LAS PESTAÑAS -----
(setq centaur-tabs-style "wave")
(setq centaur-tabs-set-bar 'over)

;; ----- CONFIGURACIÓN DE TREEMACS
;; Usar F3 para abrir Treemacs igual que NERDTree en Vim
(global-set-key [f3] 'treemacs)

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

;; Mantener el resaltado anterior de Ivy
(after! (:and ivy ivy-prescient)
  (setq ivy-prescient-retain-classic-highlighting t))

;; Utilizar un minibuffer para mostrar las funciones de ivy
(after! ivy-posframe
  (dolist (fn '(+ivy/switch-workspace-buffer
                ivy-switch-buffer))
    (setf (alist-get fn ivy-posframe-display-functions-alist) #'ivy-display-function-fallback)))

;;Mostrar tamaño de la ayuda de Ivy con ivy-rich
(after! ivy-rich
  (plist-put! ivy-rich-display-transformers-list
              'ivy-switch-buffer
              '(:columns
                ((ivy-switch-buffer-transformer (:width 60))
                 (ivy-rich-switch-buffer-size (:width 7))
                 (ivy-rich-switch-buffer-indicators (:width 4 :face error :align right))
                 (ivy-rich-switch-buffer-major-mode (:width 12 :face warning))
                 (ivy-rich-switch-buffer-project (:width 15 :face success))
                 (ivy-rich-switch-buffer-path (:width (lambda (x) (ivy-rich-switch-buffer-shorten-path x (ivy-rich-minibuffer-width 0.3))))))
                :predicate
                (lambda (cand) (get-buffer cand)))))

;; ===== Configutación de COUNSEL
(after! counsel
  ;; counsel-rg-base-command is configurable
  (setq counsel-find-file-ignore-regexp "\\(?:^[#.]\\)\\|\\(?:[#~]$\\)\\|\\(?:^Icon?\\)"
        counsel-describe-function-function 'helpful-callable
        counsel-describe-variable-function 'helpful-variable))

;; Configuración de imenu a la derecha
(use-package! imenu-list
  :defer t
  :config
  (set-popup-rules! '(("^\\*Ilist\\*" :side right :size 40 :select t))))

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
;; Utilizar la opción format-all por defecto
(setq +format-with-lsp nil)

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
    (push dir lsp-file-watch-ignored))
  )


(after! lsp-ui
  (setq lsp-ui-sideline-enable nil
        lsp-ui-doc-include-signature t
        lsp-ui-doc-max-height 15
        lsp-ui-doc-max-width 100
        lsp-ui-doc-position 'at-point))

;; ===== CONFIGURACIONES DE LOS LENGUAJES =====

;; ===== LATEX
;; LaTeX para los machos que son realmente machos y no usan Word o PowerPoint
(setq-hook! 'LaTeX-mode-hook +spellcheck-immediately nil)
(setq-hook! 'org-mode-hook +spellcheck-immediately nil)

;; ===== JULIA
;; El LSP de Julia que jala en Emacs cuando quiere
(add-hook 'julia-mode-local-vars-hook #'lsp!)
(add-hook 'ess-julia-mode-hook #'lsp-mode)
(setq lsp-julia-default-environment "~/.julia/environments/v1.5")

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

;; ===== RUST
;; SI ESTÁS USANDO ESTO, CAMBIA LAS RUTAS A TU NOMBRE DE
;; USUARIO, NO SEAS GIL
(with-eval-after-load 'rust-mode
(setq flycheck-rust-cargo-executable "/home/omar/.cargo/bin/")
(setq flycheck-rust-executable "/home/omar/.cargo/bin/rustc"))
;;(setq +rust-src-dir "~/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"))


;; ===== C/C++
(add-hook 'c-mode-local-vars-hook #'lsp!)
(add-hook 'c++-mode-local-vars-hook #'lsp!)
; Configuraciones de clangd
(setq lsp-clients-clangd-args '("-j=8"
                                "--background-index"
                                "--clang-tidy"
                                "--completion-style=detailed"
                                "--header-insertion=never"))
(after! lsp-clangd (set-lsp-priority! 'clangd 2))

;; ===== JAVASCRIPT
(after! web-mode
  (web-mode-toggle-current-element-highlight)
  (web-mode-dom-errors-show))

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

;; --- KEYBINDS perrones (favor de no mover :3)
(define-key key-translation-map (kbd "W!") (kbd "w!"))
(define-key key-translation-map (kbd "Q!") (kbd "q!"))
(define-key key-translation-map (kbd "Qall!") (kbd "qall!"))
(define-key key-translation-map (kbd "Wq!") (kbd "wq"))
(define-key key-translation-map (kbd "Wa") (kbd "wa"))
(define-key key-translation-map (kbd "wQ") (kbd "wq"))
(define-key key-translation-map (kbd "W") (kbd "w"))
(define-key key-translation-map (kbd "Q") (kbd "q"))
