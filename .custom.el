;; custom config

;; 中国源和国外源不一致
;;(setq configuration-layer--elpa-archives
;;       '(("melpa-cn" . "http://elpa.emacs-china.org/melpa-stable/")
;;       ("org-cn"   . "http://elpa.emacs-china.org/org/")
;;       ("gnu-cn"   . "http://elpa.emacs-china.org/gnu/")))

(setq-default package-check-signature nil)
(setq-default flycheck-scalastylerc (expand-file-name "scalastyle_config.xml" dotspacemacs-directory))

;; (tool-bar-mode 1)
;; (menu-bar-mode 1)
;; (scroll-bar-mode 1)
;; (set-face-attribute 'default (selected-frame) :height 150)


;; 设置和shellcommand有关的编码
(setenv "LANG" "en_US.UTF-8")
(setenv "LC_ALL" "en_US.UTF-8")
(setenv "LC_CTYPE" "en_US.UTF-8")
;; python 编码设置
(setenv "PYTHONIOENCODING" "utf-8")
;; golang

(setenv "GO111MODULE" "off")

;; erc
(setq-default dotspacemacs-configuration-layers
              '((erc :variables
                     erc-server-list
                     '(("irc.freenode.net"
                        :port "6697"
                        :ssl t
                        :nick "some-user"
                        :password "secret")
                       ("irc.myworkirc.net"
                        :port "1234"
                        :nick "some-suit"
                        :password "hunter2")))))


(eval-after-load `blog-admin
  `(progn
     ;; your config
     (setq blog-admin-backend-type 'nikola)
     (setq blog-admin-backend-path "~/work/myblog")

     (setq blog-admin-backend-new-post-in-drafts t)
     (setq blog-admin-backend-nikola-executable "nikola") ;; path to nikola executable
     (setq bloorg-nikolag-admin-backend-nikola-config-file "conf.py") ;; conf.py is default
     ))

(eval-after-load `org
  `(progn
     (setq org-agenda-dir "~/workspace/note")))

(eval-after-load `c-c++
  `(progn
     ;; Bind clang-format-region to C-M-tab in all modes:
     (global-set-key [C-M-tab] 'clang-format-region)
     ;; Bind clang-format-buffer to tab on the c++-mode only:
     (add-hook 'c++-mode-hook 'clang-format-bindings)

     (add-hook 'c++-mode-hook (lambda ()
                                (electric-indent-local-mode -1)))
     (defun clang-format-bindings ()
       (define-key c++-mode-map [tab] 'clang-format-buffer))
     ))

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-clang-tidy-setup))


(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)

(c-add-style "microsoft"
             '("stroustrup"
               (c-offsets-alist
                (innamespace . -)
                (inline-open . 0)
                (inher-cont . c-lineup-multi-inher)
                (arglist-cont-nonempty . +)
                (template-args-cont . +))))

(setq c-default-style "microsoft")

;; (add-to-list 'default-frame-alist '(foreground-color . "green"))
;; (add-to-list 'default-frame-alist '(background-color . "black"))
;; (add-to-list 'default-frame-alist '(cursor-color . "green"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(package-selected-packages
   (quote
    (terminal-here nameless font-lock+ projectile-sift org-projectile php-extras flycheck-gometalinter xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help ein request-deferred websocket deferred csv-mode erc-yt erc-view-log erc-terminal-notifier erc-social-graph erc-image erc-hl-nicks flycheck-pos-tip pos-tip flycheck noflet ensime sbt-mode scala-mode phpunit phpcbf php-auto-yasnippets drupal-mode php-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data org2nikola yaml-mode org-page git htmlize mustache ht blog-admin names ctable web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc helm-company helm-c-yasnippet fuzzy company-tern tern company-statistics company-go company-anaconda company auto-yasnippet yasnippet ac-ispell auto-complete coffee-mode smeargle orgit mmm-mode markdown-toc markdown-mode magit-gitflow helm-gitignore gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md evil-magit magit magit-popup git-commit ghub let-alist with-editor yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode dash-functional helm-pydoc cython-mode anaconda-mode pythonic go-guru go-eldoc go-mode ws-butler winum volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg eval-sexp-fu highlight elisp-slime-nav dumb-jump diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed ace-link ace-jump-helm-line helm helm-core popup evil-unimpaired f s which-key undo-tree hydra dash async aggressive-indent adaptive-wrap ace-window avy)))
 '(safe-local-variable-values
   (quote
    ((python-shell-extra-pythonpaths . "common")
     (setenv "CCX" "/usr/local/opt/llvm/bin/clang++")
     (cmake-ide-set-compiler-flags . "-stdlib=libstdc++")
     (cmake-ide-inc-dir . "~/workspace/recommend_index_cpp/app/ad_broker/build")
     (flycheck-mode t)
     (helm-ctest-dir . "~/workspace/recommend_index_cpp/app/ad_broker/build/")
     (helm-make-arguments . "-j7")
     (helm-make-build-dir . "build")
     (cmake-ide-link . ""))))
 '(tool-bar-mode nil)
 '(w3m-search-default-engine "google-en" t)
 '(yas-snippet-dirs
   (quote
    ("/home/vincent/.emacs.d/private/snippets/" "/home/vincent/.emacs.d/layers/+completion/auto-completion/local/snippets" "/home/vincent/.emacs.d/snippets/")) t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-function-name-face ((t (:inherit bold :foreground "#bc6ec5" :underline "black" :weight extra-bold)))))
