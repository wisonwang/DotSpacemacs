;;; packages.el --- org-blog layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: vincent <vincent@vincent.local>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `org-blog-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `org-blog/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `org-blog/pre-init-PACKAGE' and/or
;;   `org-blog/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst org-blog-packages
  
  '((blog-admin :location (recipe
                           :fetcher github
                           :repo "codefalling/blog-admin")))

  "The list of Lisp packages required by the org-blog layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom instalorg2nikolalation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")




(defun org-blog/init-blog-admin ()
  "Initialize blog-admin https://github.com/CodeFalling/blog-admin
                         https://qiwulun.github.io/posts/%E7%94%A8%20Nikola%20%E5%86%99%E5%8D%9A%E5%AE%A2.html
  "
  (use-package blog-admin
    :defer t
    :commands blog-admin-start
    :init
    ;; Keybinding
    (spacemacs/set-leader-keys "ab" 'blog-admin-start)
    :config
    (progn
      ;; your config
      (setq blog-admin-backend-type 'nikola)
      (setq blog-admin-backend-path "~/myblog")
      (setq blog-admin-backend-new-post-in-drafts t)
      (setq blog-admin-backend-nikola-executable "~/.virtualenvs/python3/bin/nikola") ;; path to nikola executable
      (setq bloorg-nikolag-admin-backend-nikola-config-file "conf.py") ;; conf.py is default

      (add-hook 'blog-admin-backend-after-new-post-hook 'find-file)
      )

  ))

;;; packages.el ends here
