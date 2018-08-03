(use-package docker
  :ensure t
  :bind ("C-c d" . docker))
;; (use-package docker-tramp :defer t)
;; (use-package docker-api :defer t)
(use-package dockerfile-mode :defer t)
(use-package yaml-mode :defer t)

(provide 'my-docker)
