;; оформление

(use-package base16-theme
  :ensure nil
  :config
  (load-theme 'base16-atelier-estuary t)
  (set-face-attribute 'default nil  :height 140)
  )

(use-package command-log-mode
  :ensure t)

(use-package all-the-icons
  :ensure t)

(provide 'theme)
