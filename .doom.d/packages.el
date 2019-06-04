;; -*- no-byte-compile: t; -*-
;;; ~/.doom.d/packages.el

;;; Examples:
;; (package! some-package)
;; (package! another-package :recipe (:fetcher github :repo "username/repo"))
;; (package! builtin-package :disable t)
(package! srcery-theme)
(package! ghub)
(package! org-notebook)
(package! spacemacs-theme)

;; Quitar paquetes culeros
(package! treemacs :disable t)


;; Hardcodear paquetes de rust
(package! rust-mode)
(package! racer)
(package! flycheck-rust)
(package! lsp-rust)
(package! lsp-mode)
(package! lsp-ui :recipe (:fetcher github :repo "emacs-lsp/lsp-ui"))
