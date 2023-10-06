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

(use-package org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/Documentos/org-roam")
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert))
  :config
  (org-roam-setup)
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  (org-roam-db-autosync-mode))

(use-package org-roam-ui
    :after org-roam
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))
(provide 'init-org)
;;; init-org.el ends here
