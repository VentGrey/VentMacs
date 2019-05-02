;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here


;; ----- SET THEME
(load-theme 'srcery t)

;; ----- FONT CONFIG

(setq doom-font (font-spec :family "Source Code Pro" :size 13)
      doom-variable-pitch-font (font-spec :family "Source Code Pro")
      doom-unicode-font (font-spec :family "Source Code Pro")
      doom-big-font (font-spec :family "Source Code Pro" :size 19))

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


;; --------- Neotree visuals
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(after! doom-themes
  (remove-hook 'doom-load-theme-hook #'doom-themes-neotree-config))

;; ------ PYTHON CONFIG
(setq python-shell-interpreter "python3"
    flycheck-python-pycompile-executable "python3")

;; ------- RUST CONFIGURATIONS (AGAIN PTM)
(setq flycheck-rust-cargo-executable "/home/omar/.cargo/bin/")
(setq flycheck-rust-executable "/home/omar/.cargo/bin/rustc")



;; ------ LSP Configuration
(use-package lsp-mode
  :config
  (add-hook 'c++-mode-hook #' lsp)
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

