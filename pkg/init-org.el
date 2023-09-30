;;; init-org.el --- Extensiones de OrgMode para Emacs.
;; -*- lexical-binding: t -*-

;;; Commentary:
;;
;; Extensiones de OrgMode para Emacs.

;;; Code:

(use-package toc-org
  :after org
  :commands toc-org-enable
  :init (add-hook 'org-mode-hook 'toc-org-enable))

(use-package org-bullets
  :after org)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(use-package org-side-tree
  :elpaca (:repo "https://github.com/localauthor/org-side-tree")
  :defer t
  :after org)

(provide 'init-org)
;;; init-org.el ends here
