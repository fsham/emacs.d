;; Работа с проектами

;; (use-package f
;;   :ensure t)

;; (use-package flx-ido)
;; (ido-mode 1)
;; (ido-everywhere 1)
;; (flx-ido-mode 1)
;; ;; disable ido faces to see flx highlights.
;; (setq ido-enable-flex-matching t)
;; (setq ido-use-faces nil)

;;(use-package grizzl)

(when (not (fboundp 'make-variable-frame-local))
  (defun make-variable-frame-local (variable) variable))

(use-package projectile
  :ensure t
  :config
  ;; (add-hook 'prog-mode-hook 'projectile-mode)
  ;; (setq projectile-enable-caching t)
  ;; (setq projectile-switch-project-action 'projectile-dired)
  )

;; (use-package perspective
;;   :ensure t
;;   :bind ("C-x x x" . persp-switch-last)
;;   :init (persp-mode +1)

;;   (use-package persp-projectile
;;     :ensure t
;;     :bind ("C-x x P" . projectile-persp-switch-project))

;;   :config
;;     (setq persp-interactive-completion-function #'ido-completing-read)
;;     (persp-turn-off-modestring))

(provide 'projects)
