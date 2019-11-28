(defvar org-agenda-dir ""
  "gtd org files location")

(defvar deft-dir ""
  "deft org files locaiton")

(defvar blog-admin-dir ""
  "blog-admin files location")

;;In order to export pdf to support Chinese, I should install Latex at here: https://www.tug.org/mactex/
;; http://freizl.github.io/posts/2012-04-06-export-orgmode-file-in-Chinese.html
;;http://stackoverflow.com/questions/21005885/export-org-mode-code-block-and-result-with-different-styles
(eval-after-load `org
  `(progn
	(add-hook 'org-mode-hook (lambda () (spacemacs/toggle-line-numbers-off)) 'append)
	(with-eval-after-load 'org
      (progn
		(spacemacs|disable-company org-mode)
		(spacemacs/set-leader-keys-for-major-mode 'org-mode
          "," 'org-priority)
		(require 'org-compat)
		(require 'org)
		;; (add-to-list 'org-modules "org-habit")
		(add-to-list 'org-modules 'org-habit)
		(require 'org-habit)

		(setq org-refile-use-outline-path 'file)
		(setq org-outline-path-complete-in-steps nil)
		(setq org-refile-targets
              '((nil :maxlevel . 4)
				(org-agenda-files :maxlevel . 4)))
		;; config stuck project
		(setq org-stuck-projects
              '("TODO={.+}/-DONE" nil nil "SCHEDULED:\\|DEADLINE:"))

		(setq org-agenda-inhibit-startup t) ;; ~50x speedup
		(setq org-agenda-span 'day)
		(setq org-agenda-use-tag-inheritance nil) ;; 3-4x speedup
		(setq org-agenda-window-setup 'current-window)
		(setq org-log-done t)

		(setq org-todo-keywords
              (quote ((sequence "TODO(t)" "STARTED(s)" "|" "DONE(d!/!)")
                      (sequence "WAITING(w@/!)" "SOMEDAY(S)" "|" "CANCELLED(c@/!)" "MEETING(m)" "PHONE(p)"))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;; Org clock
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

		;; Change task state to STARTED when clocking in
		(setq org-clock-in-switch-to-state "STARTED")
		;; Save clock data and notes in the LOGBOOK drawer
		(setq org-clock-into-drawer t)
		;; Removes clocked tasks with 0:00 duration
		(setq org-clock-out-remove-zero-time-clocks t) ;; Show the clocked-in task - if any - in the header line

		(setq org-tags-match-list-sublevels nil)

		(setq org-latex-default-class "ctexart")
		(setq org-latex-pdf-process
              '(
				"xelatex -interaction nonstopmode -output-directory %o %f"
				"xelatex -interaction nonstopmode -output-directory %o %f"
				"xelatex -interaction nonstopmode -output-directory %o %f"
				"rm -fr %b.out %b.log %b.tex auto"))

		(setq org-latex-listings t)

		;;reset subtask
		(setq org-default-properties (cons "RESET_SUBTASKS" org-default-properties))

		;; (add-hook 'org-after-todo-state-change-hook 'org-subtask-reset) 
		(org-babel-do-load-languages
		 'org-babel-load-languages
		 '((perl . t)
           (ruby . t)
           (shell . t)
           (dot . t)
           (js . t)
           (latex .t)
           (python . t)
           (emacs-lisp . t)
           (plantuml . t)
           (C . t)
           (ditaa . t)))

		;; copy from chinese layer
		(defadvice org-html-paragraph (before org-html-paragraph-advice
                                              (paragraph contents info) activate)
          "Join consecutive Chinese lines into a single long line without
unwanted space when exporting org-mode to html."
          (let* ((origin-contents (ad-get-arg 1))
				 (fix-regexp "[[:multibyte:]]")
				 (fixed-contents
                  (replace-regexp-in-string
                   (concat
					"\\(" fix-regexp "\\) *\n *\\(" fix-regexp "\\)") "\\1\\2" origin-contents)))
			(ad-set-arg 1 fixed-contents)))

		;; define the refile targets
		(setq org-agenda-file-note (expand-file-name "notes.org" org-agenda-dir))
		(setq org-agenda-file-gtd (expand-file-name "gtd.org" org-agenda-dir))
		(setq org-agenda-file-journal (expand-file-name "journal.org" org-agenda-dir))
		(setq org-agenda-file-code-snippet (expand-file-name "snippet.org" org-agenda-dir))
		(setq org-default-notes-file (expand-file-name "gtd.org" org-agenda-dir))
		(setq org-agenda-files (list org-agenda-dir))

		(with-eval-after-load 'org-agenda
          (define-key org-agenda-mode-map (kbd "P") 'org-pomodoro)
          (spacemacs/set-leader-keys-for-major-mode 'org-agenda-mode
			"." 'spacemacs/org-agenda-transient-state/body)
          )
		;; the %i would copy the selected text into the template
		;;http://www.howardism.org/Technical/Emacs/journaling-org.html
		;;add multi-file journal
		(setq org-capture-templates
              '(("t" "Todo" entry (file+headline org-agenda-file-gtd "Workspace")
				 "* TODO [#B] %?\n  %i\n"
				 :empty-lines 1)
				("n" "notes" entry (file+headline org-agenda-file-note "Quick notes")
				 "* %?\n  %i\n %U"
				 :empty-lines 1)
				("b" "Blog Ideas" entry (file+headline org-agenda-file-note "Blog Ideas")
				 "* TODO [#B] %?\n  %i\n %U"
				 :empty-lines 1)
				("s" "Code Snippet" entry
				 (file org-agenda-file-code-snippet)
				 "* %?\t%^g\n#+BEGIN_SRC %^{language}\n\n#+END_SRC")
				("w" "work" entry (file+headline org-agenda-file-gtd "Programing")
				 "* TODO [#A] %?\n  %i\n %U"
				 :empty-lines 1)
				("l" "links" entry (file+headline org-agenda-file-note "Quick notes")
				 "* TODO [#C] %?\n  %i\n %a \n %U"
				 :empty-lines 1)
				("j" "Journal Entry"
				 entry (file+datetree org-agenda-file-journal)
				 "* %?"
				 :empty-lines 1)))

		;;An entry without a cookie is treated just like priority ' B '.
		;;So when create new task, they are default 重要且紧急
		(setq org-agenda-custom-commands
              '(
				("w" . "任务安排")
				("wa" "重要且紧急的任务" tags-todo "+PRIORITY=\"A\"")
				("wb" "重要且不紧急的任务" tags-todo "-Weekly-Monthly-Daily+PRIORITY=\"B\"")
				("wc" "不重要且紧急的任务" tags-todo "+PRIORITY=\"C\"")
				("b" "Blog" tags-todo "BLOG")
				("p" . "项目安排")
				("pw" tags-todo "PROJECT+WORK+CATEGORY=\"cocos2d-x\"")
				("pl" tags-todo "PROJECT+DREAM+CATEGORY=\"zilongshanren\"")
				("W" "Weekly Review"
				 ((stuck "") ;; review stuck projects as designated by org-stuck-projects
                  (tags-todo "PROJECT") ;; review all projects (assuming you use todo keywords to designate projects)
                  ))))


		(define-key org-mode-map (kbd "s-p") 'org-priority)
		(spacemacs/set-leader-keys-for-major-mode 'org-mode
          "tl" 'org-toggle-link-display)
		(define-key evil-normal-state-map (kbd "C-c C-w") 'org-refile)
		)
      )))

(eval-after-load `org-brain
  `(progn
	(setq org-brain-path "~/workspace/note/mybrain")
	;; For Evil users
	(with-eval-after-load 'evil
	  (evil-set-initial-state 'org-brain-visualize-mode 'emacs))
	:config
	(setq org-id-track-globally t)
	(setq org-id-locations-file "~/.emacs.d/.org-id-locations")
	(push '("b" "Brain" plain (function org-brain-goto-end)
			"* %i%?" :empty-lines 1)
		  org-capture-templates)
	(setq org-brain-visualize-default-choices 'all)
	(setq org-brain-title-max-length 12)))

