
; Sivirk emacs config

(package-initialize)

(add-to-list 'load-path (concat user-emacs-directory "elisp"))
(add-to-list 'load-path (concat user-emacs-directory "private"))
(add-to-list 'load-path (concat user-emacs-directory "github/tern/emacs"))

(require 'base)
;; (require 'baseosx nil t)

(require 'variables nil t)
(require 'core)
(require 'theme)

(require 'misc)
(require 'projects)
(require 'flychecker)

(require 'lang-php)
(require 'lang-web)
(require 'lang-javascript)
(require 'lang-ruby)
(require 'lang-c)
(require 'lang-solidity)
(require 'lang-python)
(require 'lang-erl)
(require 'my-docker)

;; Put in your .emacs or site-start.el file the following lines:
(require 'cygwin-mount)
(cygwin-mount-activate)
(require 'setup-cygwin)

(put 'downcase-region 'disabled nil)
