(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes (quote (srcery)))
 '(custom-safe-themes
   (quote
    ("144f05e2dfa7a7b50cad0c3519498ac064cc9da1f194b8ea27d0fb20129d8d7a" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(display-line-numbers t)
 '(fill-column 80)
 '(hl-todo-keyword-faces
   (quote
    (("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#4f97d7")
     ("OKAY" . "#4f97d7")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#86dc2f")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX" . "#dc752f")
     ("XXXX" . "#dc752f")
     ("???" . "#dc752f"))))
 '(inhibit-default-init t)
 '(inhibit-startup-buffer-menu nil)
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(neo-theme (quote icons))
 '(package-selected-packages
   (quote
    (git-gutter spaceline-all-the-icons ivy-explorer autopair rainbow-delimiters imenu-list fill-column-indicator srcery-theme all-the-icons-dired counsel all-the-icons-ivy all-the-icons neotree company-lsp lsp-ui lsp-mode lsp-rustmode flycheck-inline flycheck-rust company racer flycheck rust-mode evil spaceline spacemacs-theme)))
 '(pdf-view-midnight-colors (quote ("#b2b2b2" . "#292b2e")))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(spaceline-buffer-id-max-length 40))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(menu-bar-mode -1)
(tool-bar-mode -1)
(require 'spaceline-config)
(spaceline-spacemacs-theme)

;; Quitar los archivos castrosos
(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files

;; Vim For Emacs
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

;; Desmadre de Rust
(setq racer-cmd "~/.cargo/bin/racer")
(setq racer-rust-src-path "~/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src")

(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)

(require 'rust-mode)
(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)

;; Neotree para que poder navegar entre archivos
(require 'neotree)
(global-set-key [f3] 'neotree-toggle)

;; Motor de completado (Ligero)
(ivy-mode 1)

;; Iconos fresas
(require 'all-the-icons)

;; Desmadres para Company Mode
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)


;; Barra para no pasarse de verga con los 80 caracteres
(add-hook 'after-change-major-mode-hook 'fci-mode)

;; Completado de paréntesis
(require 'autopair)
(autopair-global-mode) ;; enable autopair in all buffers

;; Tagbar perrona
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(global-set-key (kbd "C-'") #'imenu-list-smart-toggle)
