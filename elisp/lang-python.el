(use-package elpy
  :init
  (setq python-shell-interpreter "jupyter"
        python-shell-interpreter-args "console --simple-prompt")
  :config
  (elpy-enable)
  )
(provide 'lang-python)
