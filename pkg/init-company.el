;;; init-company.el --- Configuraciones propias de company para el autocompletado.
;; -*- lexical-binding: t -*-

;;; Commentary:
;;
;; Configuraciones propias de company para el autocompletado.

;;; Code:

(use-package company
  :defer 2
  :diminish
  :config
  (setq company-begin-commands '(self-insert-command)
        company-idle-delay 0.1
        company-minimum-prefix-length 3
        company-tooltip-align-annotations t
        company-tooltip-margin 0)
  (global-company-mode t))

(use-package company-box
  :after company
  :diminish
  :hook (company-mode . company-box-mode))

(use-package company-shell
  :after company
  :init
  (add-to-list 'company-backends '(company-shell company-shell-env)))

(use-package company-emoji
  :after company
  :init
  (add-to-list 'company-backends 'company-emoji))

(use-package company-restclient
  :after company
  :config
  (add-to-list 'company-backends 'company-restclient))

(use-package company-web
  :after (company web-mode)
  :config
  (add-to-list 'company-backends '(company-web-html :with company-yasnippet)))

(use-package company-wordfreq
  :after company
  :config
  (add-hook 'text-mode-hook (lambda ()
                            (setq-local company-backends '(company-wordfreq))
                            (setq-local company-transformers nil))))

(provide 'init-company)
;;; init-company.el ends here
