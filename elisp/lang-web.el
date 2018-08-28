(use-package mustache-mode
  :mode
  (("\\.mst\\'" . mustache-mode))
  )

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

(use-package sass-mode
  :mode (("\\.scss\\'" . scss-mode)
         ("\\.sass\\'" . scss-mode)
         )
  )

(use-package slim-mode
  :mode (("\\.slim\\'" . slim-mode))
  )

(provide 'lang-web)
