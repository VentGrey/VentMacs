;;; init-org.el --- Extensiones de OrgMode para Emacs.
;; -*- lexical-binding: t -*-

;;; Commentary:
;;
;; Extensiones de OrgMode para Emacs.

;;; Code:

(use-package toc-org
  :commands toc-org-enable
  :hook (org-mode . toc-org-enable))

(use-package org-bullets
  :hook (org-mode . org-bullets-mode))

(use-package org-side-tree
  :elpaca (:repo "https://github.com/localauthor/org-side-tree")
  :defer 1)

(use-package org-modern
    :hook (org-mode . org-modern-mode))

(provide 'init-org)
;;; init-org.el ends here
