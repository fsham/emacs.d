(use-package elpy
  :init
  (setq python-shell-interpreter "python"
        python-shell-interpreter-args "-i")
  :config
  (elpy-enable)
  )
(provide 'lang-python)
