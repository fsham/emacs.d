(defun my-php-lookup (url)
  (let ((symbol (symbol-at-point)))
    (if (not symbol)
        (message "No symbol at point.")
      (browse-url (concat url (symbol-name symbol))))))

(defun my-php-symbol-lookup ()
  (interactive)
  (my-php-lookup "http://php.net/manual-lookup.php?pattern="))

(defun my-php-laravel-lookup ()
  (interactive)
  (my-php-lookup "https://laravel.com/api/5.6/search.html?search="))

(defun my-mdn-lookup ()
  (interactive)
  (my-php-lookup "https://developer.mozilla.org/en-US/search?q="))


(use-package ac-php)
(use-package flymake-php)

;; (add-to-list 'load-path "~/.emacs.d/vendor/ac-php")
(require 'ac-php)

(defun php-array-indent-hook ()
  (defun ywb-php-lineup-arglist-intro (langelem)
    (save-excursion
      (goto-char (cdr langelem))
      (vector (+ (current-column) c-basic-offset))))
  (defun ywb-php-lineup-arglist-close (langelem)
    (save-excursion
      (goto-char (cdr langelem))
      (vector (current-column))))
  (c-set-offset 'arglist-intro 'ywb-php-lineup-arglist-intro)
  (c-set-offset 'arglist-close 'ywb-php-lineup-arglist-close)
  )

(use-package php-mode
  :init
  (add-hook 'php-mode-hook 'php-array-indent-hook)
  (add-hook 'php-mode-hook
            '(lambda ()
               (auto-complete-mode t)
               (require 'ac-php)
               (setq ac-sources  '(ac-source-php ) )
               ;; (yas-global-mode 1)
               ;; ;; (require 'company-php)
               ;; (company-mode t)
               ;; (add-hook 'before-save-hook 'php-cs-fixer-before-save)
               ;; (add-to-list 'company-backends 'company-ac-php-backend)
               (ac-php-core-eldoc-setup ) ;; enable eldoc
               (define-key php-mode-map  (kbd "C-]") 'ac-php-find-symbol-at-point)   ;goto define
               (define-key php-mode-map  (kbd "C-t") 'ac-php-location-stack-back)    ;go back
               ))
  :mode
  (("\\.php\\'" . php-mode))
  :config
  (use-package flymake-php)
  ;; (add-hook 'php-mode-hook 'flymake-php-load)
  :bind (("C-c h p" . my-php-symbol-lookup)
         ("C-c h l" . my-php-laravel-lookup))
  )

(custom-set-variables
 '(flycheck-phpcs-standard "PSR2"))

(custom-set-variables
 '(flycheck-phpmd-rulesets '("cleancode" "codesize" "controversial" "design" "unusedcode")))


(with-eval-after-load 'php-mode
  (define-key php-mode-map (kbd "C-c C--") 'php-current-class)
  (define-key php-mode-map (kbd "C-c C-=") 'php-current-namespace))


;; (use-package php-auto-yasnippets)
;; (use-package php-eldoc)

;; (defun php-mode-options ()
;;   (php-eldoc-enable)
;;   (cond
;;     ((string-match-p "^/my-project-folder")
;;      (php-eldoc-probe-load "http://my-project.com/probe.php?secret=sesame"))
;;     ((string-match-p "^/other-project-folder")
;;      (php-eldoc-probe-load "http://localhost/otherproject/probe.php?secret=sesame"))))
;; (add-hook 'php-mode-hook 'php-mode-options)


;; (add-hook 'php-mode-hook 'php-enable-default-coding-style)
;; (setq php-mode-coding-style (quote psr2))
;; (add-hook 'php-mode-hook (lambda () (subword-mode 1)))


(use-package stylus-mode)

(provide 'lang-php)
;;;
