;; custom config

;; 中国源和国外源不一致
;; (setq configuration-layer--elpa-archives
;;       '(("melpa-cn" . "http://elpa.emacs-china.org/melpa-stable/")
;;       ("org-cn"   . "http://elpa.emacs-china.org/org/")
;;       ("gnu-cn"   . "http://elpa.emacs-china.org/gnu/")))


(setq configuration-layer-elpa-archives '(("melpa" . "melpa.org/packages/")
										  ("org" . "orgmode.org/elpa/")
										  ("gnu" . "elpa.gnu.org/packages/")))

(setq url-proxy-services
      '(("no_proxy" . "^\\(localhost\\|10\\..*\\|192\\.168\\..*\\)")
        ("http" . "127.0.0.1:1087")
        ("https" . "127.0.0.1:1087")))

;; (set-default package-check-signature nil)
(setq dotspacemacs-elpa-https nil)
;; 生成编辑临时文件
(setq create-lockfiles nil)

(setq-default flycheck-scalastylerc (expand-file-name "scalastyle_config.xml" dotspacemacs-directory))

;;(scroll-bar-mode 1)
(set-face-attribute 'default (selected-frame) :height 150)

;; 设置和shellcommand有关的编码
;; (setenv "BASH_ENV" "$HOME/.bashrc")
;;(setq shell-command-switch "-ic")

(setenv "LANG" "en_US.UTF-8")
(setenv "LC_ALL" "en_US.UTF-8")
(setenv "LC_CTYPE" "en_US.UTF-8")
;; python 编码设置
(setenv "PYTHONIOENCODING" "utf-8")
;; golang
(setenv "GO111MODULE" "auto")
(setenv "GOROOT" "/usr/local/go")
(setq global-visual-line-mode t)

;; erc
;; (setq-default dotspacemacs-configuration-layers
;;               '((erc :variables
;;                      erc-server-list
;;                      '(("irc.freenode.net"
;;                         :port "6697"
;;                         :ssl t
;;                         :nick "some-user"
;;                         :password "secret")
;;                        ("irc.myworkirc.net"
;;                         :port "1234"
;;                         :nick "some-suit"
;;                         :password "hunter2")))))


;; org relate

(eval-after-load `blog-admin
  `(progn
     ;; your config
     (setq blog-admin-backend-type 'nikola)
     (setq blog-admin-backend-path "~/myblog")
     (setq blog-admin-backend-new-post-in-drafts t)
     (setq blog-admin-backend-nikola-executable "nikola") ;; path to nikola executable
     (setq bloorg-nikolag-admin-backend-nikola-config-file "conf.py") ;; conf.py is default
     ))

(eval-after-load `org
  `(progn
	 (setq org-startup-with-inline-images t)
	 (setq org-export-with-sub-superscripts nil)
	 (add-to-list `org-agenda-files "~/workspace/note")
	 (setq org-journal-dir "~/workspace/journal/")
	 ))


(setq go-test-verbose "-v -x")

(eval-after-load `go
  `(progn
	 (setq flycheck-golangci-lint-disable-linters (list "unused"))))

(eval-after-load `org-mode
  `(progn
	 (add-hook `org-mode-hook (lambda ()
								(c-set-style "google")))
	 (setq org-confirm-babel-evaluate nil)   ;don't prompt me to confirm everytime I want to evaluate a block

     ;;; display/update images in the buffer after I evaluate
	 (add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)

	 (org-babel-do-load-languages
      'org-babel-load-languages
      '((plantuml . t)
        ))
	 ))

(with-eval-after-load 'org-agenda
  (require 'org-projectile)
  (setq org-projectile-projects-file "~/workspace/projects.org")
  (mapcar '(lambda (file)
			 (when (file-exists-p file)
			   (push file org-agenda-files)))
		  (org-projectile-todo-files)))


(eval-after-load `c-c++
  `(progn
     ;; Bind clang-format-region to C-M-tab in all modes:
     (global-set-key [C-M-tab] 'clang-format-region)
     ;; Bind clang-format-buffer to tab on the c++-mode only:
     (add-hook 'c++-mode-hook 'clang-format-bindings)

     (add-hook 'c++-mode-hook (lambda ()
                                (electric-indent-local-mode -1)
								(c-set-style "whitesmith")))

     (defun clang-format-bindings ()
       (define-key c++-mode-map [tab] 'clang-format-buffer))
     ))

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-clang-tidy-setup))


(eval-after-load `ob-ipython
  `(progn
	 (setq ob-ipython-command "/Users/vincent/.pyenv/shims/jupyter")
	 (setq org-babel-default-header-args:ipython '((:session . "none")
												   (:results . "output")
												   (:exports . "none")
												   (:result-type "output")
												   (:cache . "no")
												   (:noweb . "no")
												   (:hlines . "no")
												   (:tangle . "no")
												   (:eval . "never-export"))
		   )
			))

(eval-after-load `lsp-pyls
  `(progn (setq lsp-pyls-server-command "/Users/vincent/.pyenv/shims/pyls")))

;; (setq c-default-style "whitesmith")

