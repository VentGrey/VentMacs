;; -*- no-byte-compile: t; -*-
;;; ~/.doom.d/packages.el

;;; Examples:
;; (package! some-package)
;; (package! another-package :recipe (:fetcher github :repo "username/repo"))
;; (package! builtin-package :disable t)
(package! srcery-theme)
(package! spacemacs-theme)
;; Show beautiful parenthesis
(package! rainbow-delimiters)
;; Julia LSP that works whenever it wants
(package! lsp-julia)
;; treemacs with LSP
(package! lsp-treemacs)
;; Meson mode cause emacs is caca
(package! meson-mode)

;; ----- Deshabilitar paquetes que no utilizo en emacs para ahorrar disco ----
(package! feedmail :disable t)
(package! ruby-mode :disable t)
(package! soap-client :disable t)
(package! tetris :disable t)
(package! timeclock :disable t)
