;; оформление

;; (use-package base16-theme
;;   :config
;;   (load-theme 'base16-phd t)
;;   (set-face-attribute 'default nil  :height 110)
;;   )

;; (use-package gotham-theme
;;   :config
;;   (load-theme 'gotham t)
;;   )

(use-package zenburn-theme
  :config
  (load-theme 'zenburn t)
  )

;; (use-package material-theme
;;   :config
;;   (load-theme 'material t)
;;   )

;; (use-package cyberpunk-theme
;;   :config
;;   (load-theme 'cyberpunk t)
;;   )

(defun transparency (value)
  "Sets the transparency of the frame window. 0=transparent/100=opaque"
  (interactive "nTransparency Value 0 - 100 opaque:")
  (set-frame-parameter (selected-frame) 'alpha value))
(add-to-list 'default-frame-alist '(alpha . (100 100)))

(use-package command-log-mode
  :ensure t)

(provide 'theme)
