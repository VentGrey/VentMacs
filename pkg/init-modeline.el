;;; init-modeline.el --- Configuraciones para la modeline de Emacs.
;; -*- lexical-binding: t -*-

;;; Commentary:
;;
;; Configuraciones para la modeline de Emacs

;;; Code:

;; Definir nuestros propios indicadores usando las nerd-fonts. Si no están
;; presentes en tu sistema puedes instalarlas desde:
;; https://www.nerdfonts.com/
(defconst my-moodline-glyphs
  '((:checker-info . ?)
    (:checker-issues . ?)
    (:checker-good . ?)
    (:checker-errored . ?)
    (:checker-interrupted . ?)

    (:vc-added . ?)
    (:vc-needs-merge . ?)
    (:vc-needs-update . ?)
    (:vc-conflict . ?)
    (:vc-good . ?)

    (:buffer-narrowed . ?▼)
    (:buffer-modified . ?)
    (:buffer-read-only . ?)

    (:count-separator . ?✕)
    )
  "Iconos personalizados para mood-line.")

(use-package mood-line

  ;; Enable mood-line
  :config
  (setq mood-line-glyph-alist my-moodline-glyphs
        mood-line-show-indentation-style t
        mood-line-show-eol-style t
        mood-line-show-encoding-information t
        mood-line-show-cursor-point t
        mood-line-show-major-mode t)
  (mood-line-mode))

(provide 'init-modeline)
;;; init-modeline.el ends here
