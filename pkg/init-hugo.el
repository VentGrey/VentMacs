;;; init-hugo.el --- Edición de blogs en Hugo para Emacs.
;; -*- lexical-binding: t -*-

;;; Commentary:
;;
;; Emacs + Hugo = ❤️

;;; Code:

(use-package easy-hugo
  :defer t
  :config
  (easy-hugo-enable-menu))

(provide 'init-hugo)
;;; init-hugo.el ends here
