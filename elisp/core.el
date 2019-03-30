
;; Основые модули системы

(use-package spinner)
(use-package seq)
(use-package hydra)

(when (boundp 'my-github-token)
   (use-package paradox
    :config
    (progn
      ;; The "paradox-token" file is supposed to contain this line:
      ;;     (setq paradox-github-token "<YOUR_TOKEN>")
      (setq paradox-github-token my-github-token)
      (load (locate-user-emacs-file "paradox-token") :noerror :nomessage)

      (setq paradox-lines-per-entry 1)
      (setq paradox-automatically-star t)

      (paradox-enable))))

(use-package bm
  :ensure t
  :bind (("C-c =" . bm-toggle)
         ("C-c [" . bm-previous)
         ("C-c ]" . bm-next)))


(use-package yasnippet-snippets)

;; Custom binding for magit-status
(use-package magit
  :init
  ;; (global-magit-file-mode 1)
  (add-hook 'magit-mode-hook 'turn-on-magit-gitflow)
  :bind
  (("C-x g" . magit-status)
   ("C-x M-g" . magit-dispatch-popup))
  )
(use-package magit-gitflow)

;; (setq inhibit-startup-message t)
;; (global-linum-mode)
(setq-default left-fringe-width  2)
;;(setq-default right-fringe-width  10)
;;(set-face-attribute 'fringe nil :background "black")

;; Выравнивает весь буффер
(defun iwb ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

(global-set-key (kbd "C-c n") 'iwb)

(electric-pair-mode -1)

(use-package browse-kill-ring)
(use-package know-your-http-well)

(use-package ggtags)

(provide 'core)
