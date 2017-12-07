
(use-package web-mode
  :bind (("C-c C-g" . web-mode-set-engine)
         ("C-c h p" . my-php-symbol-lookup)
         ("C-c h l" . my-php-laravel-lookup))
  :mode (("\\.html\\'" . web-mode)
         ("\\.html\\.erb\\'" . web-mode)
         ("\\.mustache\\'" . web-mode)
         ("\\.blade\\." . web-mode))
  :config
  (progn
    (setq web-mode-engines-alist
          '(("blade"  . "\\.blade\\.")))
    (setq web-mode-enable-auto-indentation nil)
    ))


(provide 'lang-web)
