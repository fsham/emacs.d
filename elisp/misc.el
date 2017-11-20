
;; Всякие нужности

(use-package markdown-mode
  :ensure t)

(use-package htmlize
  :ensure t)

(use-package s
  :ensure t)

;; (use-package hydra
;;   :ensure t)

;; (use-package yasnippet
;;   :ensure t
;;   :diminish yas
;;   :config
;;   (yas/global-mode 1)
;;   (add-to-list 'yas-snippet-dirs (concat init-dir "snippets")))

(use-package company
  :ensure t
  :bind (("C-c /". company-complete))
  :config
  (global-company-mode)
  )

;; (use-package magit-gitflow
;;   :ensure t
;;   :config
;;   (add-hook 'magit-mode-hook 'turn-on-magit-gitflow))

(use-package restclient
  :ensure t)

(use-package dockerfile-mode
  :ensure t)

;; helper functions


(defun nuke-all-buffers ()
  (interactive)
  (mapcar 'kill-buffer (buffer-list))
  (delete-other-windows))

(setq mac-right-alternate-modifier nil)

;; Customize EWW for dark background
;; (setq shr-color-visible-luminance-min 80)

(provide 'misc)
