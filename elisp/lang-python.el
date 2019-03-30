(use-package elpy
  :config
  (setq python-shell-interpreter "python3"
      python-shell-interpreter-args "-i")
  (elpy-enable)
  )

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(provide 'lang-python)
