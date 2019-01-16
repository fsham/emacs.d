(setq fill-column 80)

(setq gc-cons-threshold (* 80 1024 1024))
(setq gc-cons-percentage 0.5)
(setq gnutls-min-prime-bits 4096)

;; (add-to-list 'package-archives
;; 	     '("melpa" . "https://melpa.org/packages/")
;;              '("elpy" . "http://jorgenschaefer.github.io/packages/"))

(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "http://melpa.org/packages/")
                         ("melpa-stable"     . "https://stable.melpa.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))

(when (not package-archive-contents)
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(defconst private-dir  (expand-file-name "private" user-emacs-directory))
(defconst temp-dir (format "%s/cache" private-dir)
  "Hostname-based elisp temp directories")

;; Core settings
;; UTF-8 please
(set-charset-priority 'unicode)
(set-default-coding-systems 'utf-8)
(setq locale-coding-system   'utf-8)   ; pretty
(set-terminal-coding-system  'utf-8)   ; pretty
(set-keyboard-coding-system  'utf-8)   ; pretty
(set-selection-coding-system 'utf-8)   ; please
(prefer-coding-system 'utf-8)
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))

;; Emacs customizations
(setq
      confirm-nonexistent-file-or-buffer  t
      save-interprogram-paste-before-kill t
      mouse-yank-at-point                 t
      require-final-newline               t
      visible-bell                        nil
      ring-bell-function                  'ignore
      custom-file                         "~/.emacs.d/.custom.el"
      ;; http://ergoemacs.org/emacs/emacs_stop_cursor_enter_prompt.html
      minibuffer-prompt-properties
      '(read-only t point-entered minibuffer-avoid-prompt face minibuffer-prompt)

      ;; Disable non selected window highlight
      cursor-in-non-selected-windows     nil
      highlight-nonselected-windows      nil
      ;; PATH
      exec-path                          (append exec-path '("/usr/local/bin/"))
      indent-tabs-mode                   nil
      ;; inhibit-startup-message            t
      fringes-outside-margins            t
      x-select-enable-clipboard          t
      use-package-always-ensure          t
      async-shell-command-display-buffer nil)

;; Bookmarks
(setq
 ;; persistent bookmarks
 bookmark-save-flag                      t
 bookmark-default-file              (concat temp-dir "/bookmarks"))

;; Backups enabled, use nil to disable

;; (fset 'yes-or-no-p 'y-or-n-p)
;;(global-auto-revert-mode t)

;; Disable toolbar & menubar
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (  fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; (show-paren-mode 1)

;; Delete trailing whitespace before save
;; (add-hook 'before-save-hook 'delete-trailing-whitespace)

(menu-bar-mode -99)
(setq column-number-mode t)
(setq size-indication-mode t)
(global-hl-line-mode -1)
;(setq cursor-type 'bar)
;(setq-default cursor-type 'bar)
(setq-default indent-tabs-mode nil)
(display-time-mode 1)
(display-battery-mode t)


(setq c-basic-offset 4)
(setq-default tab-width 4)

;; The following lines are always needed.  Choose your own keys.
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)


;; more useful frame title, that show either a file or a
;; buffer name (if the buffer isn't visiting a file)
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))
(delete-selection-mode t)
(global-auto-revert-mode t)

;; hippie expand is dabbrev expand on steroids
(setq hippie-expand-try-functions-list '(try-expand-dabbrev
                                         try-expand-dabbrev-all-buffers
                                         try-expand-dabbrev-from-kill
                                         try-complete-file-name-partially
                                         try-complete-file-name
                                         try-expand-all-abbrevs
                                         try-expand-list
                                         try-expand-line
                                         try-complete-lisp-symbol-partially
                                         try-complete-lisp-symbol))

;; use hippie-expand instead of dabbrev
(global-set-key (kbd "M-/") #'hippie-expand)
(global-set-key (kbd "s-/") #'hippie-expand)

;; replace buffer-menu with ibuffer
(global-set-key (kbd "C-x C-b") #'ibuffer)

;; align code in a pretty way
(global-set-key (kbd "C-x \\") #'align-regexp)
(setq
 history-length                     1000
 history-delete-duplicates          t

 backup-inhibited                   nil
 ;;make-backup-files                  t
 auto-save-default                  nil
 ;;auto-save-list-file-name           (concat temp-dir "/autosave")
 make-backup-files                  t
 create-lockfiles                   nil
 backup-directory-alist            `((".*" . ,(concat temp-dir "/backup/")))
 auto-save-file-name-transforms    `((".*" ,(concat temp-dir "/auto-save-list/") t)))

(defun what-face (pos)
  (interactive "d")
  (let ((face (or (get-char-property (point) 'read-face-name)
                  (get-char-property (point) 'face))))
    (if face (message "Face: %s" face) (message "No face at %d" pos))))

(global-set-key "\C-cw" 'compare-windows)
(auto-image-file-mode t)

(setq ispell-program-name "hunspell"
      ispell-dictionary "english")

(global-set-key "\C-\M-z" 'scroll-other-window-down)

(add-hook 'dired-load-hook
          (lambda ()
            ;; Bind dired-x-find-file.
            (setq dired-x-hands-off-my-keys nil)
            (load "dired-x")
            (setq dired-omit-files
                (concat dired-omit-files "\\|^\\..+$"))
            ))
(autoload 'dired-jump "dired-x"
  "Jump to Dired buffer corresponding to current buffer." t)

(autoload 'dired-jump-other-window "dired-x"
  "Like \\[dired-jump] (dired-jump) but in other window." t)

(define-key global-map "\C-x\C-j" 'dired-jump)
(define-key global-map "\C-x4\C-j" 'dired-jump-other-window)
(setq dired-listing-switches "-alih")

(load-file "~/.emacs.d/sql-upcase.el")
(when (require 'sql-upcase nil :noerror)
  (add-hook 'sql-mode-hook 'sql-upcase-mode)
  (add-hook 'sql-interactive-mode-hook 'sql-upcase-mode))

(desktop-save-mode 1)
(setq desktop-auto-save-timeout 5)

;; Appointments
(appt-activate 1)
(setq
 appt-display-format 'echo
 appt-display-mode-line t
 appt-audible t
 )

(provide 'base)
;;; base ends here
