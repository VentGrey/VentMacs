;;; init-c.el --- Configuraciones de C, el lenguaje de programación de los espartanos
;; -*- lexical-binding: t -*-

;;; Commentary:
;;
;; Configuraciones de C para Emacs.

;;; Code:

;; Estilo de código de Linux. Como es, como deberá de ser siempre.
(setq c-default-style "linux"
      c-doc-domment-style "doxygen"
      c-basic-offset 8)

(setq c-ts-mode-indent-offset 8)

(provide 'init-c)
;;; init-c.el ends here
