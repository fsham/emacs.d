
;; Основые модули системы

(use-package spinner)
(use-package seq)
(use-package hydra)

(when (boundp 'my-github-token)
  (use-package paradox
    :defer t
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
  (global-magit-file-mode 1)
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

;; (use-package dash-functional)
;; (use-package all-the-icons)
;; (use-package treemacs
;;   :ensure t
;;   :defer t
;;   :config
;;   (progn
;;     (use-package treemacs-evil
;;       :ensure t
;;       :demand t)
;;     (setq treemacs-follow-after-init          t
;;           treemacs-width                      50
;;           treemacs-indentation                2
;;           treemacs-git-integration            t
;;           treemacs-collapse-dirs              3
;;           treemacs-silent-refresh             nil
;;           treemacs-change-root-without-asking nil
;;           treemacs-sorting                    'alphabetic-desc
;;           treemacs-show-hidden-files          t
;;           treemacs-never-persist              nil
;;           treemacs-is-never-other-window      nil
;;           treemacs-goto-tag-strategy          'refetch-index)

;;     (treemacs-follow-mode t)
;;     (treemacs-filewatch-mode t)))

;; (use-package treemacs-projectile
;;   :defer t
;;   :ensure t
;;   :config
;;   (setq treemacs-header-function #'treemacs-projectile-create-header))

;; ;; (global-set-key (kbd "C-x C-e") 'treemacs-projectile)
;; (global-set-key (kbd "C-x C-q") 'treemacs-projectile-toggle)

;; (with-eval-after-load "treemacs"
;;   (defvar treemacs-custom-html-icon (all-the-icons-icon-for-file "name.html"))
;;   (treemacs-define-custom-icon treemacs-custom-html-icon "html" "htm"))

;; (with-eval-after-load "treemacs"
;;   (defvar treemacs-custom-php-icon (all-the-icons-icon-for-file "name.php"))
;;   (treemacs-define-custom-icon treemacs-custom-php-icon "php" "php"))

;; (with-eval-after-load "treemacs"
;;   (defvar treemacs-custom-js-icon (all-the-icons-icon-for-file "name.js"))
;;   (treemacs-define-custom-icon treemacs-custom-js-icon "js" "js")
;;   (treemacs-define-custom-icon treemacs-custom-js-icon "jsx" "jsx")
;;   )

;; git clone https://github.com/sebastiencs/sidebar.el.git
;; (use-package ov)
;; (add-to-list 'load-path "~/.local/share/icons-in-terminal/") ;; If it's not already done
;; (add-to-list 'load-path "~/.emacs.d/vendor/sidebar.el")
;; (require 'sidebar)
;; (global-set-key (kbd "C-x C-e") 'sidebar-open)
;; (global-set-key (kbd "C-x C-a") 'sidebar-buffers-open)


;; ; For programming buffers
;; (use-package highlight-indentation
;;   :config
;;   (add-hook 'prog-mode-hook #'highlight-indentation-current-column-mode))


(provide 'core)
