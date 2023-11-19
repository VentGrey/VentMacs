;;; init-perl.el --- Configuraciones de Perl, Emacs perrón. Para un lenguaje perrón.
;; -*- lexical-binding: t -*-

;;; Commentary:
;;
;; Configuraciones de Perl para Emacs.

;;; Code:

(setq cperl-hairy t)
(setq cperl-indent-parens-as-block t)
(setq cperl-close-paren-offset (- cperl-indent-level))

(provide 'init-perl)
;;; init-perl.el ends here
