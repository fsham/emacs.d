
; Sivirk emacs config

(package-initialize)

(add-to-list 'load-path (concat user-emacs-directory "elisp"))
(add-to-list 'load-path (concat user-emacs-directory "private"))

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
(require 'docker)
