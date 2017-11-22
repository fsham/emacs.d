
(use-package web-mode
  :mode (("\\.html\\'" . web-mode)
         ("\\.html\\.erb\\'" . web-mode)
         ("\\.mustache\\'" . web-mode)
         ("\\.blade\\." . web-mode))
  :config
  (progn
    (setq web-mode-engines-alist
          '(("blade"  . "\\.blade\\.")))))


(provide 'lang-web)
