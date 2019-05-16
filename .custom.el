;; custom config

;; 中国源和国外源不一致
;; (setq configuration-layer--elpa-archives
;;       '(("melpa-cn" . "http://elpa.emacs-china.org/melpa-stable/")
;;       ("org-cn"   . "http://elpa.emacs-china.org/org/")
;;       ("gnu-cn"   . "http://elpa.emacs-china.org/gnu/")))

(setq-default flycheck-scalastylerc (expand-file-name "scalastyle_config.xml" dotspacemacs-directory))

(tool-bar-mode 1)
(menu-bar-mode 1)
;;(scroll-bar-mode 1)
(set-face-attribute 'default (selected-frame) :height 150)

;; 设置和shellcommand有关的编码
(setenv "LANG" "en_US.UTF-8")
(setenv "LC_ALL" "en_US.UTF-8")
(setenv "LC_CTYPE" "en_US.UTF-8")
;; python 编码设置
(setenv "PYTHONIOENCODING" "utf-8")
;; golang

(setenv "GO111MODULE" "on")



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(package-selected-packages
   (quote
    (typit chess dic-lookup-w3m company-quickhelp mu4e-maildirs-extension mu4e-alert alert log4e gntp helm-dash dash-at-point nginx-mode helm-w3m w3m chinese-word-at-point youdao-dictionary yasnippet-snippets projectile-sift org-projectile php-extras flycheck-gometalinter xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help ein request-deferred websocket deferred csv-mode erc-yt erc-view-log erc-terminal-notifier erc-social-graph erc-image erc-hl-nicks flycheck-pos-tip pos-tip flycheck noflet ensime sbt-mode scala-mode phpunit phpcbf php-auto-yasnippets drupal-mode php-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data org2nikola yaml-mode org-page git htmlize mustache ht blog-admin names ctable web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc helm-company helm-c-yasnippet fuzzy company-tern tern company-statistics company-go company-anaconda company auto-yasnippet yasnippet ac-ispell auto-complete coffee-mode smeargle orgit mmm-mode markdown-toc markdown-mode magit-gitflow helm-gitignore gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md evil-magit magit magit-popup git-commit ghub let-alist with-editor yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode dash-functional helm-pydoc cython-mode anaconda-mode pythonic go-guru go-eldoc go-mode ws-butler winum volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg eval-sexp-fu highlight elisp-slime-nav dumb-jump diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed ace-link ace-jump-helm-line helm helm-core popup evil-unimpaired f s which-key undo-tree hydra dash async aggressive-indent adaptive-wrap ace-window avy)))
 '(tool-bar-mode nil)
 '(w3m-search-default-engine "google-en" t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-function-name-face ((t (:inherit bold :foreground "#bc6ec5" :underline "black" :weight extra-bold)))))
