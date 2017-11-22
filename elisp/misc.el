
;; Всякие нужности

(use-package markdown-mode
  :ensure t)

(use-package htmlize
  :ensure t)

(use-package s
  :ensure t)

(use-package windmove
  :bind
  ("C-x <up>" . windmove-up)
  ("C-x <down>" . windmove-down)
  ("C-x <left>" . windmove-left)
  ("C-x <right>" . windmove-right))

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


(use-package whitespace
  :bind ("C-c T w" . whitespace-mode)
  :init
  (setq whitespace-line-column nil
        whitespace-display-mappings '((space-mark 32 [183] [46])
                                      (newline-mark 10 [9166 10])
                                      (tab-mark 9 [9654 9] [92 9])))
  :config
  (set-face-attribute 'whitespace-space       nil :foreground "#666666" :background nil)
  (set-face-attribute 'whitespace-newline     nil :foreground "#666666" :background nil)
  (set-face-attribute 'whitespace-indentation nil :foreground "#666666" :background nil)
  :diminish whitespace-mode)

;; (use-package fill
;;   :bind (("C-c T f" . auto-fill-mode)
;;          ("C-c T t" . toggle-truncate-lines))
;;   :init (add-hook 'org-mode-hook 'turn-on-auto-fill)
;;   :diminish auto-fill-mode)

(use-package recentf
  :config
  (setq recentf-save-file (recentf-expand-file-name "~/.emacs.d/private/cache/recentf"))
  (recentf-mode 1))


(provide 'misc)
