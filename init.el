
; Sivirk emacs config

(package-initialize)

(add-to-list 'load-path (concat user-emacs-directory "elisp"))

(require 'base)
(require 'baseosx)

(require 'core)
(require 'theme)

(require 'misc)
(require 'projects)
(require 'flychecker)

(require 'lang-php)
(require 'lang-web)
(require 'lang-javascript)
(require 'lang-ruby)
