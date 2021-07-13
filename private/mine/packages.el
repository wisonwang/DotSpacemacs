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

    ;; dash-functional
	  (ob-ipython :location local)
    (rtags :location (recipe
                      :fetcher github
                      :repo "Andersbakken/rtags"
                      :version-regexp "v2.33"))

    cmake-ide
    flycheck-clang-tidy
	  cal-china-x
	  ;; org-alert
	)
  )


;; (defun mine/init-org-alert ()
;;   (use-package org-alert
;; 	:ensure t
;; 	:init (eval-after-load `org-alert
;; 			`(progn
;; 			(defun my-alert-osx-notifier-notify (info)
;; 			  (apply #'call-process "osascript" nil nil nil "-e"
;; 					 (list (format "display notification %S with title %S sound name \"Submarine\""
;; 								   (alert-encode-string (plist-get info :message))
;; 								   (alert-encode-string (plist-get info :title)))))
;; 			  (alert-message-notify info))

;; 			(alert-define-style 'my-osx-notifier :title "my Notify using native OSX notification" :notifier #'my-alert-osx-notifier-notify)
;; 			(setq org-alert-interval 600)
;; 			(setq alert-default-style 'my-osx-notifier)
;;    ))))


;; (defun mine/init-dash-functional()
;;   (use-package dash-functional
;; 		:ensure t
;; 		:init
;; 		))

(defun mine/init-ob-ipython ()(use-package ob-ipython
								:ensure t
								:init
								))

(defun mine/pre-init-flycheck ()
                    (use-package flycheck
                      :ensure t
                      :init (global-flycheck-mode)))


(defun mine/init-cal-china-x ()
  (use-package cal-china-x
	:ensure t
	:init
	(eval-after-load `cal-china-x
	  `(progn
		 (setq mark-holidays-in-calendar t)
		 (setq cal-china-x-important-holidays cal-china-x-chinese-holidays)
		 (setq cal-china-x-general-holidays '((holiday-lunar 1 15 "元宵节")))
		 (setq calendar-holidays
			   (append cal-china-x-important-holidays
					   cal-china-x-general-holidays
					   ))
		 ))
	))


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
