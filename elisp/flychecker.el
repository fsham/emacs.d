
;; (use-package pos-tip)
;; (setq pos-tip-background-color "#ff0000")

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode)
  :config
  (setq flycheck-check-syntax-automatically '(save idle-change mode-enabled)
        flycheck-idle-change-delay 2.0
        flycheck-display-errors-delay 0.1
        flycheck-highlighting-mode 'lines
        ;; flycheck-phpcs-standard 'PSR2
        flycheck-indication-mode nil
        ;; 'flycheck-fringe-bitmap-double-arrow
        flycheck-standard-error-navigation t ; [M-g n/p]
        flycheck-deferred-syntax-check nil
        ;; flycheck-mode-line '(:eval (flycheck-mode-line-status-text))
        ;; flycheck-completion-system nil ; 'ido, 'grizzl, nil
        )
  )

;; (use-package flycheck-color-mode-line)
(use-package flycheck-pos-tip)

(with-eval-after-load 'flycheck
  (flycheck-pos-tip-mode))

;; (use-package flycheck-popup-tip)
;; (with-eval-after-load 'flycheck
;;   '(add-hook 'flycheck-mode-hook 'flycheck-popup-tip-mode))


(custom-set-variables
 '(flycheck-popup-tip-error-prefix "* "))

(set-face-attribute 'flycheck-warning nil
                    :background "#b58900"
                    :foreground "#262626"
                    :underline nil)

(set-face-attribute 'flycheck-error nil
                    :background "#dc322f"
                    :foreground "#262626"
                    :underline nil)

(add-to-list 'display-buffer-alist
             `(,(rx bos "*Flycheck errors*" eos)
              (display-buffer-reuse-window
               display-buffer-in-side-window)
              (side            . right)
              (reusable-frames . visible)
              (window-width   . 0.5)))


(provide 'flychecker)
