
;; Всякие нужности

(use-package markdown-mode
  :ensure t)

(use-package htmlize
  :ensure t)

(use-package s
  :ensure t)

;; (use-package hydra
;;   :ensure t)

(use-package yasnippet
  :ensure t
  :diminish yas
  :config
  (yas/global-mode 1)
  (add-to-list 'yas-snippet-dirs (concat init-dir "snippets")))

(use-package company
  :ensure t
  :bind (("C-c /". company-complete))
  :config
  (global-company-mode)
  )

(use-package magit-gitflow
  :ensure t
  :config
  (add-hook 'magit-mode-hook 'turn-on-magit-gitflow))

(provide 'misc)
