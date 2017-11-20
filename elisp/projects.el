;; Работа с проектами

(use-package f
  :ensure t)

(use-package flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

(use-package grizzl)

(use-package projectile
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'projectile-mode)
  (setq projectile-enable-caching t)
  ;; (setq projectile-switch-project-action 'projectile-dired)
  )

(use-package perspective)
(persp-mode)

(use-package persp-projectile)
(define-key projectile-mode-map (kbd "C-x p") 'projectile-persp-switch-project)

(provide 'projects)
