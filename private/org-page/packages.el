;;; packages.el --- org-page layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Vincent <vincent@Vincents-MacBook-Pro.local>
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
;; added to `org-page-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `org-page/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `org-page/pre-init-PACKAGE' and/or
;;   `org-page/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst org-page-packages
  '(blog-admin)
  "The list of Lisp packages required by the org-page layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(defun org-page/init-blog-admin ()
  "Initialize blog-admin"
  (use-package blog-admin
    :defer t
    :commands blog-admin-start
    :init
    ;; Keybinding
    (spacemacs/set-leader-keys "ab" 'blog-admin-start)
    :config
    (progn
      ;; Open post after create new post
      (add-hook 'blog-admin-backend-after-new-post-hook 'find-file)
      ;; Hexo
     (setq blog-admin-backend-path "~/myblog")
     (setq blog-admin-backend-type 'hexo)
     ;; create new post in drafts by default
     (setq blog-admin-backend-new-post-in-drafts t)
     ;; create same-name directory with new post
     (setq blog-admin-backend-new-post-with-same-name-dir t)
     ;; default assumes _config.yml
     (setq blog-admin-backend-hexo-config-file "_config.yml"))
     (add-hook 'blog-admin-backend-after-new-post-hook 'find-file) ;; Open post after create new post
     (setq blog-admin-backend-hexo-template-org-post  ;; post 模板
 		       "#+TITLE: %s
 		       #+AUTHOR: Vincent Wang
           #+EMAIL: fangfu2012@gmail.com
 		       #+DATE: %s
 		       #+LAYOUT: post
 		       #+TAGS:
 		       #+CATEGORIES:
 		       #+DESCRIPTON:
 		       ")
   )
  )

;;; packages.el ends here
