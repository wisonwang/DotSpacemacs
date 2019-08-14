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
                                                                            org-blog
                                      ;; youdao
                                      (chinese :packages youdao-dictionary fcitx
                                               :variables chinese-enable-fcitx nil
                                               chinese-enable-youdao-dict t)
                                      w3m

                                      pandoc

                                      (syntax-checking :variables
                                                       syntax-checking-enable-by-default t
                                                       syntax-checking-enable-tooltips nil
                                                       syntax-checking-use-original-bitmaps t)

                                      (python :variables python-test-runner '(pytest nose)
                                              python-fill-column 99
                                              python-enable-yapf-format-on-save t
                                              python-sort-imports-on-save t
                                              )
                                      ipython-notebook
                                      ;; golang
                                      (go :variables
                                          gofmt-command "goimports"
                                          go-use-golangci-lint t
                                          )

                                      ;; scala
                                      (scala :variables scala-auto-start-ensime t
                                             scala-indent:use-javadoc-style t)

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

                                      (cmake :variables cmake-enable-cmake-ide-support t)
                                      (c-c++ :variables
                                               c-c++-enable-clang-support t
                                               c-c++-default-mode-for-headers 'c++-mode
                                               c-c++-enable-google-style t
                                               c-c++-enable-google-newline t)

                            

                                      )
                                    )



