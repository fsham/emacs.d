
(use-package ac-php)
;; (use-package flymake-php)

;; (add-to-list 'load-path "~/.emacs.d/vendor/ac-php")
;; (require 'ac-php)


(use-package php-mode
  :mode
  (("\\.php\\'" . php-mode))
  :config
  (add-hook 'php-mode-hook
	    '(lambda ()
               (auto-complete-mode t)
               (require 'ac-php)
               (setq ac-sources  '(ac-source-php ) )
               (yas-global-mode 1)
	       ;; (require 'company-php)
	       ;; (company-mode t)
               ;; (add-hook 'before-save-hook 'php-cs-fixer-before-save)
	       ;; (add-to-list 'company-backends 'company-ac-php-backend)
               ;; (define-key php-mode-map  (kbd "C-]") 'ac-php-find-symbol-at-point)   ;goto define
               ;; (define-key php-mode-map  (kbd "C-t") 'ac-php-location-stack-back)    ;go back
               (ac-php-core-eldoc-setup ) ;; enable eldoc
               (define-key php-mode-map  (kbd "C-]") 'ac-php-find-symbol-at-point)   ;goto define
               (define-key php-mode-map  (kbd "C-t") 'ac-php-location-stack-back)    ;go back
               )))

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


(provide 'lang-php)
;;;
