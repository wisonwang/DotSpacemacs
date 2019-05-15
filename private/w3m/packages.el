;;; packages.el --- w3m layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Kuroi Mato <venmos@fuck.gfw.es>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Code:

(setq w3m-packages
      '(
        w3m
        helm-w3m
        ))

(defun v/w3m-save-buffer-to-file ()
  (interactive)
  (let* ((curr (buffer-file-name))
         (new (read-file-name
               "Save to file: " nil nil nil
               (and curr (file-name-nondirectory curr))))
         (mustbenew (if (and curr (file-equal-p new curr)) 'excl t)))
    (if (use-region-p)
        (write-region (region-beginning) (region-end) new nil nil nil mustbenew)
      (save-restriction
        (widen)
        (write-region (point-min) (point-max) new nil nil nil mustbenew)))))

(defun v/w3m-player-movie ()
  (interactive)
  (let ((link (w3m-anchor)))
    (if (not link)
        (message "The point is not link.")
      (cond ((string-match "/\\/www\\.youtube\\.com\\/watch\/?" link)
             (message (concat "loading from youtube..." link))
             (call-process "mpv" nil nil nil link))
            ((string-match "/\\/www\\.bilibili\\.com\\/video\/" link)
             (message (concat "loading from bilibili..." link))
             (call-process "bilidan" nil nil nil link)))
      (message "Sorry, Playback error. please check url."))))

(defun v/w3m-copy-link ()
  (interactive)
  (let ((link (w3m-anchor)))
    (if (not link)
        (message "The point is not link.")
      (kill-new link)
      (message "Copy \"%s\" to clipboard." link))))

(defun w3m/init-helm-w3m ()
  "Initializes helm-w3m and adds keybindings for its exposed functionalities."
  (use-package helm-w3m
    :commands (helm-w3m-bookmarks)
    :init
    (progn
      (spacemacs/set-leader-keys
        "awb" 'helm-w3m-bookmarks))))

(defun v/w3m-open-url-with (fn url)
  "Open url according to w3m url open function 'fn', and auto handle url prefix"
  (cond ((string-prefix-p "http://" url) (funcall fn url))
        ((string-prefix-p "https://" url) (funcall fn url))
        (t (funcall fn (concat "http://" url)))))

(defun v/w3m-open-url (url)
  "Opens url in new w3m session with 'http://' appended"
  (interactive
   (list (read-string "Enter website address (default: google.com):" nil nil "google.com" nil )))
  (v/w3m-open-url-with 'w3m-goto-url url))

(defun v/w3m-open-url-new-session (url)
  "Opens url in new w3m session with 'http://' appended"
  (interactive
   (list (read-string "Enter website address (default: google.com):" nil nil "google.com" nil )))
  (v/w3m-open-url-with 'w3m-goto-url-new-session url))

(defun w3m/init-w3m()
  "Initializes w3m and adds keybindings for its exposed functionalities."
  (use-package w3m
    :defer t
    :init
    (spacemacs/set-leader-keys
      "awo" 'w3m-goto-url
      "awf" 'w3m-find-file
      "aws" 'w3m-search
      )

    (setq w3m-search-default-engine "gc")
    (setq w3m-search-engine-alist
          '(("gg" "http://www.google.com/search?q=%s" utf-8)
            ("gc" "http://www.google.com/search?hl=ch-zh&q=%s" utf-8)
            ;; stackoverflow search
            ("sf" "http://www.google.com/search?q=%s+site:stackoverflow.com" utf-8)
            ;; elisp code search
            ("cs" "http://www.google.com/search?q=%s+filetype:el"  utf-8)
            ;; wikipedia
            ("wp" "http://en.wikipedia.org/wiki/Special:Search?search=%s" utf-8)
            ;; online dictionary
            ("d" "http://dictionary.reference.com/search?q=%s" utf-8)
            ("be" "https://www.baidu.com/s?wd=%s&hl=en" utf-8)
            ("b" "https://www.baidu.com/s?wd=%s" utf-8) 
            ("bi" "https://www.bing.com/search?q=%s&qs=n&form=QBRE" utf-8)
            ("bic" "https://www.bing.com/search?q=%s&qs=n&form=BESBTB" utf-8)
            ;; javascript search on mozilla.org
            ("j" "http://www.google.com/search?q=%s+site:developer.mozilla.org" utf-8)))

    (setq w3m-uri-replace-alist
          `(("\\`gg:" w3m-search-uri-replace "gg")
            ("\\`gc:" w3m-search-uri-replace "gc")
            ("\\`sf:" w3m-search-uri-replace "sf")
            ("\\`cs:" w3m-search-uri-replace "cs")
            ("\\`d:" w3m-search-uri-replace "d")
            ("\\`wp:" w3m-search-uri-replace "wp")
            ("\\`b:" w3m-search-uri-replace "b")
            ("\\`be:" w3m-search-uri-replace "be")
            ("\\`bi:" w3m-search-uri-replace "bi")
            ("\\`bic:" w3m-search-uri-replace "bic")
            ("\\`urn:ietf:rfc:\\([0-9]+\\)" w3m-pattern-uri-replace "http://www.ietf.org/rfc/rfc\\1.txt"))
          )
    (progn
      (evilified-state-evilify-map w3m-mode-map
        :mode w3m-mode
        :eval-after-load w3m
        :bindings
        "0" 'evil-digit-argument-or-evil-beginning-of-line
        "$" 'evil-end-of-line
        "f" 'evil-find-char
        "F" 'evil-find-char-backward
        "o" 'ace-link-eww
        "wp" 'v/w3m-player-movie
        "wy" 'v/w3m-copy-link
        "wf" 'w3m-find-file
        "wo" 'w3m-goto-url
        "wO" 'w3m-goto-url-new-session
        "wt" 'w3m-view-this-url-new-session
        "wT" 'w3m-create-empty-session
        "ws" 'w3m-search
        "wS" 'w3m-search-new-session
        "wl" 'w3m-next-buffer
        "wh" 'w3m-previous-buffer
        "wx" 'w3m-delete-buffer
        "wd" 'v/w3m-save-buffer-to-file
        "wD" 'w3m-save-buffer
        "we" 'w3m-bookmark-edit
        "wa" 'w3m-bookmark-add-current-url
        "wm" 'w3m-view-url-with-external-browser
        "wb" 'helm-w3m-bookmarks
        "wB" 'w3m-bookmark-view

        ))))

(with-eval-after-load 'w3m
  (define-key w3m-mode-map (kbd "C-f") 'evil-scroll-page-down)
  (define-key w3m-mode-map (kbd "C-b") 'evil-scroll-page-up)
  (define-key w3m-mode-map (kbd "SPC") 'evil-evilified-state))


(setq w3m-home-page "https://www.google.com")
;; W3M Home Page
(setq w3m-default-display-inline-images t)
(setq w3m-default-toggle-inline-images t)
;; W3M default display images
(setq w3m-command-arguments '("-cookie" "-F"))
(setq w3m-use-cookies t)
;; W3M use cookies
(setq browse-url-browser-function 'w3m-browse-url)
;; Browse url function use w3m
(setq w3m-view-this-url-new-session-in-background t)
;; W3M view url new session in background
;;change default browser for 'browse-url'  to w3m
(setq browse-url-browser-function 'w3m-goto-url-new-session)

;;change w3m user-agent to android
(setq w3m-user-agent "Mozilla/5.0 (Linux; U; Android 2.3.3; zh-ch; HTC_Pyramid Build/GRI40) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.")

;;quick access hacker news
(defun hn ()
  (interactive)
  (browse-url "http://news.ycombinator.com"))

;;quick access reddit
(defun reddit (reddit)
  "Opens the REDDIT in w3m-new-session"
  (interactive (list
                (read-string "Enter the reddit (default: psycology): " nil nil "psychology" nil)))
  (browse-url (format "http://m.reddit.com/r/%s" reddit))
  )

;;i need this often
(defun wikipedia-search (search-term)
  "Search for SEARCH-TERM on wikipedia"
  (interactive
   (let ((term (if mark-active
                   (buffer-substring (region-beginning) (region-end))
                 (word-at-point))))
     (list
      (read-string
       (format "Wikipedia (%s):" term) nil nil term)))
   )
  (browse-url
   (concat
    "http://en.m.wikipedia.org/w/index.php?search="
    search-term
    ))
  )

;;when I want to enter the web address all by hand
(defun w3m-open-site (site)
  "Opens site in new w3m session with 'http://' appended"
  (interactive
   (list (read-string "Enter website address(default: w3m-home):" nil nil w3m-home-page nil )))
  (w3m-goto-url-new-session
   (concat "http://" site)))


(defun v/init-w3m ()

  (use-package w3m
    :init
    (progn
      (setq browse-url-browser-function 'w3m-goto-url-new-session
            w3m-user-agent "Mozilla/5.0 (Linux; U; Android 2.3.3; zh-tw; HTC_Pyramid Build/GRI40) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533."
            w3m-coding-system 'utf-8
            w3m-file-coding-system 'utf-8
            w3m-file-name-coding-system 'utf-8
            w3m-input-coding-system 'utf-8
            w3m-output-coding-system 'utf-8
            w3m-terminal-coding-system 'utf-8)

      )
    :config

    :after
    ))

;;; packages.el ends here
