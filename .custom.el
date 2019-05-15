;; custom config

;; 中国源和国外源不一致
;; (setq configuration-layer--elpa-archives
;;       '(("melpa-cn" . "http://elpa.emacs-china.org/melpa-stable/")
;;       ("org-cn"   . "http://elpa.emacs-china.org/org/")
;;       ("gnu-cn"   . "http://elpa.emacs-china.org/gnu/")))

(setq-default flycheck-scalastylerc "/Users/vincent/scalastyle_config.xml")

(tool-bar-mode 1)
(menu-bar-mode 1)
;;(scroll-bar-mode 1)
(set-face-attribute 'default (selected-frame) :height 150)

(add-to-list 'load-path "~/.emacs.d/lisp/nikola")
(require 'org2nikola)
;; OPTIONAL, set the root directory of nikola
;; "~/.config/nikola/posts" contains the *.meta and *.wp
(setq org2nikola-output-root-directory "~/.config/nikola/output")

(defun org2nikola-after-hook-setup (title slug)
  "see https://help.github.com/articles/setting-up-a-custom-domain-with-github-pages/ for setup
 run `ln -s ~/projs/redguardtoo.github.io ~/.config/nikola/output'`, btw"
  (let ((url (concat "http://wisonwang.github.io/output/" slug ".html"))
        (nikola-dir (file-truename "~/.config/nikola/output"))
        cmd)
    ;; copy the blog url into kill-ring
    (kill-new url)
    (message "%s => kill-ring" url)
    ;; nikola is building posts ...
    (shell-command (format "cd %s; nikola build" nikola-dir))
    (setq cmd "cd ~/workspace/wisonwang.github.io;git add .;git commit -m 'updated';git push origin")
    (shell-command cmd)
    ))

(add-hook 'org2nikola-after-hook 'org2nikola-after-hook-setup)
;; 设置和shellcommand有关的编码
(setenv "LANG" "en_US.UTF-8")
(setenv "LC_ALL" "en_US.UTF-8")
(setenv "LC_CTYPE" "en_US.UTF-8")
;; python 编码设置
(setenv "PYTHONIOENCODING" "utf-8")

