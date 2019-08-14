;;; packages.el --- mine layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: vincent <vincent@wangwenshengdeMacBook-Pro.local>
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
;; added to `mine-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `mine/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `mine/pre-init-PACKAGE' and/or
;;   `mine/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst mine-packages
  '(
    ;;ipython-notebook
    ;; (flycheck :location (recipe
    ;;                        :fetcher github
    ;;                        :repo "flycheck/flycheck"))

    (rtags :location (recipe
                      :fetcher github
                      :repo "Andersbakken/rtags"
                      :version-regexp "v2.33"))

    cmake-ide
    flycheck-clang-tidy
    )
  )

(defun mine/pre-init-flycheck ()
                    (use-package flycheck
                      :ensure t
                      :init (global-flycheck-mode)))

(defun mine/pre-init-cmake-ide () 
  (use-package cmake-ide
    :ensure t
    :init 
    (cmake-ide-setup)
    )
 )

(defun mine/pre-init-rtags ()
  (use-package rtags
    :ensure t
    :config
    (setq rtags-verify-protocol-version nil)
    )
  )

(defun mine/init-flycheck-clang-tidy ()
  (use-package flycheck-clang-tidy
    :ensure t
    :config
    )
  )

;;; packages.el ends here
