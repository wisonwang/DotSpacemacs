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
  '(
    ;; org
    ;; (org :location built-in
    ;;      :variables
    ;;      org-enable-github-support t
    ;;      org-enable-reveal-js-support t)
    org-pomodoro
    deft
    (blog-admin :location (recipe
                           :fetcher github
                           :repo "codefalling/blog-admin"))
    )
  )
 
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
      (add-hook 'blog-admin-backend-after-new-post-hook 'find-file)
      )

  ))

(defun org-blog/post-init-org-pomodoro ()
  (progn
    (add-hook 'org-pomodoro-finished-hook '(lambda () (zilongshanren/growl-notification "Pomodoro Finished" "☕️ Have a break!" t)))
    (add-hook 'org-pomodoro-short-break-finished-hook '(lambda () (zilongshanren/growl-notification "Short Break" "🐝 Ready to Go?" t)))
    (add-hook 'org-pomodoro-long-break-finished-hook '(lambda () (zilongshanren/growl-notification "Long Break" " 💪 Ready to Go?" t)))
    ))


(defun org-blog/post-init-deft ()
  (progn
    (setq deft-use-filter-string-for-filename t)
    (setq deft-recursive t)
    (setq deft-extension "org")
    (setq deft-directory deft-dir)))


;;; packages.el ends here
