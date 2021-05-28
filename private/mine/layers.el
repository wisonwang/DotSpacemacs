;;; layers.el --- Spacemacs Layer layers File
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(configuration-layer/declare-layers '(
									  lsp
									  tabnine
									  (org :variables
										   org-enable-github-support t
										   org-enable-sticky-header t
										   org-enable-reveal-js-support t
										   org-projectile-file "TODOs.org"
										   org-enable-org-journal-support t)

 
									  org-blog
                                      ;; youdao
                                      (chinese :packages youdao-dictionary fcitx
                                               :variables chinese-enable-fcitx nil
                                               chinese-enable-youdao-dict t)
									  ;; pdf
                                      pandoc

                                      (syntax-checking :variables
                                                       syntax-checking-enable-by-default t
                                                       syntax-checking-enable-tooltips nil
                                                       syntax-checking-use-original-bitmaps t)

                                      (python :variables python-test-runner '(pytest nose)
                                              python-fill-column 99
                                              python-enable-yapf-format-on-save t
                                              python-sort-imports-on-save t
											  python-backend 'anaconda
											  ;; python-lsp-server 'pyls
											  python-formatter 'yapf
                                              )
                                      
									  (ipython-notebook :variables ein-backend 'jupyter)
                                      ;; golang
                                      (go :variables
                                          gofmt-command "goimports"
                                          go-use-golangci-lint t
										  go-format-before-save t
										  go-backend 'go-mode
										  godoc-at-point-function 'godoc-gogetdoc
                                          )
									  sphinx
									  restructuredtext
                                      ;; scala
                                      ;; (scala :variables
                                      ;;       scala-indent:use-javadoc-style t)

									  (java :variables java-backend 'meghanada)

                                      ;; dash
                                      ;; (mu4e :variables
                                      ;;       mu4e-installation-path "/usr/local/Cellar/mu/1.0_1/share/emacs/site-lisp"
                                      ;;       mu4e-mu-binary "/usr/local/Cellar/mu/1.0_1/bin/mu"
                                      ;;       mu4e-account-alist t
                                      ;;       mu4e-enable-notifications t
                                      ;;       mu4e-enable-mode-line t
                                      ;;       )

                                      ;; erc

                                      ;; mychat
									  search-engine
									  
                                      (cmake :variables cmake-enable-cmake-ide-support t)
                                      (c-c++ :variables
											 c-c++-backend 'lsp-clangd
											 ;; c++-enable-organize-includes-on-save t
                                             c-c++-enable-clang-support t
											 c-c++-adopt-subprojects t
											 c-c++-default-mode-for-headers 'c++-mode
											 c-c++-enable-google-style t
											 c-c++-enable-google-newline t)

                            
									  
                                      (plantuml :variables plantuml-jar-path "~/workspace/plantuml-1.2019.11/target/plantuml-1.2019.12-SNAPSHOT.jar"
												org-plantuml-jar-path "~/workspace/plantuml-1.2019.11/target/plantuml-1.2019.12-SNAPSHOT.jar")

									  ;; (elfeed :variables
									  ;; 		  elfeed-enable-web-interface t
 									  ;; 		  rmh-elfeed-org-files (list "~/workspace/note/elfeed.org"))

                                      ))



