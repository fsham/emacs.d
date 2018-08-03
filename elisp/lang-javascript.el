;; js2-mode
;; https://github.com/mooz/js2-mode
(use-package js2-mode
  :defer t
  :bind (:map js2-mode-map
              (("C-x C-e" . js-send-last-sexp)
               ("C-M-x" . js-send-last-sexp-and-go)
               ("C-c C-b" . js-send-buffer-and-go)
               ("C-c C-l" . js-load-file-and-go)
               ("M-." . nil)
               ))
  :mode
  ("\\.js$" . js2-mode)
  ("\\.json$" . js2-jsx-mode)
  :config
  (custom-set-variables '(js2-strict-inconsistent-return-warning nil))
  (custom-set-variables '(js2-strict-missing-semi-warning nil))

  (setq js-indent-level 2)
  (setq js2-indent-level 2)
  (setq js2-basic-offset 2)
  (setq sgml-basic-offset 2)
  (add-hook 'js2-mode-hook #'js2-imenu-extras-mode)
  (use-package js2-refactor :defer t
    :diminish js2-refactor-mode
    :config
    (js2r-add-keybindings-with-prefix "C-c j r"))
  (add-hook 'js2-mode-hook 'js2-refactor-mode)

  (use-package xref-js2
    :defer t
    :config
    (add-to-list 'xref-js2-ignored-dirs "public"))
  (add-hook 'js2-mode-hook (lambda ()
                             (flycheck-mode 0)
                             (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))

  ;; (require 'tern)
  ;; (require 'tern-auto-complete)

  ;; tern :- IDE like features for javascript and completion
  ;; http://ternjs.net/doc/manual.html#emacs
  ;; (use-package company)
  ;; (use-package company-tern)
  ;; (add-to-list 'company-backends 'company-tern)
  ;; (add-hook 'js2-mode-hook (lambda ()
  ;;                          (tern-mode)))

  ;; Disable completion keybindings, as we use xref-js2 instead
  ;; (define-key tern-mode-keymap (kbd "M-.") nil)
  ;; (define-key tern-mode-keymap (kbd "M-,") nil)
  (define-key js2-mode-map (kbd "M-.") nil)
  (use-package flymake-jslint :defer t)
  ;; (add-hook 'js2-mode-hook 'flymake-jslint-load)

  (use-package rjsx-mode
    :mode
    ("\\.jsx$" . rjsx-mode)
    :config
    (add-hook 'rjsx-mode-hook (lambda ()
                                ;; (tern-mode)
                                (flymake-mode 0)
                                ;; (company-mode)
                                ))
    (defadvice js-jsx-indent-line (after js-jsx-indent-line-after-hack activate)
      "Workaround sgml-mode and follow airbnb component style."
      (save-excursion
        (beginning-of-line)
        (if (looking-at-p "^ +\/?> *$")
            (delete-char sgml-basic-offset))))
    ;; (use-package ac-js2 :defer t)
    ;; (add-hook 'rjsx-mode-hook 'ac-js2-mode)
    )
  (use-package prettier-js)
  ;; (add-hook 'js2-mode-hook 'prettier-js-mode)
  ;; Run a JavaScript interpreter in an inferior process window
  ;; https://github.com/redguardtoo/js-comint
  ;; (use-package js-comint
  ;;   :config
  ;;   (setq inferior-js-program-command "node"))
  )
;; (use-package ac-js2 :defer t)
;; (add-hook 'js2-mode-hook 'ac-js2-mode)
(use-package js-import)
(use-package react-snippets)
(use-package angular-snippets)

(use-package typescript-mode :defer t)

(provide 'lang-javascript)
