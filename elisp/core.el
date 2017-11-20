
;; Основые модули системы


(use-package bm
  :ensure t
  :bind (("C-c =" . bm-toggle)
         ("C-c [" . bm-previous)
         ("C-c ]" . bm-next)))


(use-package counsel
  :ensure t
  :bind
  (("M-x" . counsel-M-x)
   ("M-y" . counsel-yank-pop)
   :map ivy-minibuffer-map
   ("M-y" . ivy-next-line)))

(use-package swiper
  :pin melpa-stable
  :diminish ivy-mode
  :ensure t
  :bind*
  (("C-s" . swiper)
   ("C-c C-r" . ivy-resume)
   ("C-x C-f" . counsel-find-file)
   ("C-c h f" . counsel-describe-function)
   ("C-c h v" . counsel-describe-variable)
   ("C-c i u" . counsel-unicode-char)
   ("M-i" . counsel-imenu)
   ("C-c g" . counsel-git)
   ("C-c j" . counsel-git-grep)
   ("C-c k" . counsel-ag)
   ("C-c l" . scounsel-locate))
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (define-key read-expression-map (kbd "C-r") #'counsel-expression-history)
    (ivy-set-actions
     'counsel-find-file
     '(("d" (lambda (x) (delete-file (expand-file-name x)))
        "delete"
        )))
    (ivy-set-actions
     'ivy-switch-buffer
     '(("k"
        (lambda (x)
          (kill-buffer x)
          (ivy--reset-state ivy-last))
        "kill")
       ("j"
        ivy--switch-buffer-other-window-action
        "other window")))))


;; (use-package ace-window
;;   :ensure t
;;   :config
;;   (global-set-key (kbd "C-x o") 'ace-window))

;; (use-package ace-jump-mode
;;   :ensure t
;;   :config
;;   (define-key global-map (kbd "C-c SPC") 'ace-jump-mode))


;; (use-package counsel-projectile
;;   :ensure t
;;   :config
;;   (counsel-projectile-on))

;; (use-package ivy-hydra :ensure t)



;; Custom binding for magit-status
(use-package magit
  :config
  (global-set-key (kbd "C-c m") 'magit-status))

(setq inhibit-startup-message t)
(global-linum-mode)
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

(electric-pair-mode t)


(provide 'core)
