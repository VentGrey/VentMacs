;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here


(defvar xdg-data (getenv "XDG_DATA_HOME"))
(defvar xdg-config (getenv "XDG_CONFIG_HOME"))

;; ----- IVY CONFIGS
(setq +ivy-buffer-icons t)

;; ----- SET THEME
(load-theme 'doom-dracula t)

;; ----- Tamaño de inicio
  (setq initial-frame-alist
        '((width . 110)
          (height . 65)))
;; ----- FONT CONFIG

(setq doom-font (font-spec :family "Fira Code" :size 12)
      doom-variable-pitch-font (font-spec :family "Fira Code")
      doom-unicode-font (font-spec :family "Fira Code")
      doom-big-font (font-spec :family "Fira Code" :size 19))

;; ------- NEOTREE CONFIG
  (require 'neotree)
  (global-set-key [f3] 'neotree-toggle)

;; -------- Modeline CONFIG
(setq doom-modeline-icon t)
(setq doom-neotree-file-icons t)
(setq doom-modeline-major-mode-icon t)
(setq doom-modeline-major-mode-color-icon nil)
(setq doom-modeline-github t)
(setq doom-modeline-github-interval (* 30 60))
(setq doom-modeline-env-version t)

(setq +doom-modeline-buffer-file-name-style 'relative-from-project
      show-trailing-whitespace t)
(add-hook! minibuffer-setup (setq-local show-trailing-whitespace nil))


;; -------- Change Banner
(setq +doom-dashboard-banner-file (expand-file-name "banner.png" doom-private-dir))


;; --------- Neotree visuals
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(after! doom-themes
  (remove-hook 'doom-load-theme-hook #'doom-themes-neotree-config))

;; ------ PYTHON CONFIG
(setq python-shell-interpreter "python3"
    flycheck-python-pycompile-executable "python3")

(use-package pipenv
  :hook (python-mode . pipenv-mode)
  :init
  (setq
   pipenv-projectile-after-switch-function
   #'pipenv-projectile-after-switch-extended))

;; ------- RUST CONFIGURATIONS (AGAIN PTM)
(setq flycheck-rust-cargo-executable "/home/omar/.cargo/bin/")
(setq flycheck-rust-executable "/home/omar/.cargo/bin/rustc")
(with-eval-after-load 'rust-mode
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))
(setq +rust-src-dir "~/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src")

;; ------- Rust VERY BASIC configurations

(def-package! rust-mode
  :mode "\\.rs$"
  :config
  (flycheck-mode))

(def-package! lsp-rust
  :after (lsp-mode lsp-ui rust-mode)
  :config
  (setq lep-rust-rls-command '("rustup" "run" "nightly" "rls"))
  :hook
  (rust-mode . lsp-rust-enable))

;; ------ LSP Configuration
(use-package lsp-mode
  :config
  (add-hook 'c++-mode-hook #' lsp)
  (add-hook 'c-mode-hook #' lsp)
  (setq lsp-clients-clangd-executable "/usr/bin/clangd-7")

  (add-hook 'python-mode-hook #' lsp)
  (add-hook 'rust-mode-hook #' lsp)
  ;: C++ Config
)

(use-package lsp-ui
  :requires lsp-mode flycheck
  :config

  (setq lsp-ui-doc-enable t
        lsp-ui-doc-use-childframe t
        lsp-ui-doc-position 'top
        lsp-ui-doc-include-signature t
        lsp-ui-sideline-enable nil
        lsp-ui-flycheck-enable t
        lsp-ui-flycheck-list-position 'right
        lsp-ui-flycheck-live-reporting t
        lsp-ui-peek-enable t
        lsp-ui-peek-list-width 60
        lsp-ui-peek-peek-height 25)

  (add-hook 'lsp-mode-hook 'lsp-ui-mode))
(use-package company
  :config
  (setq company-idle-delay 0.3)

  (global-company-mode 1)

  (global-set-key (kbd "C-<tab>") 'company-complete))

(use-package company-lsp
  :requires company
  :config
  (push 'company-lsp company-backends)

   ;; Disable client-side cache because the LSP server does a better job.
  (setq company-transformers nil
        company-lsp-async t
        company-lsp-cache-candidates nil))

(def-package! lsp-mode
  :hook
  (haskell-mode . lsp)
  (python-mode . lsp)
  :config
  (require 'lsp-clients))

;; ESHELL
(add-hook 'eshell-mode-hook #'hide-mode-line-mode)

;; IVY
(setq +ivy-buffer-icons t)
