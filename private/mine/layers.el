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
                                      
                                      (python :variables python-test-runner '(pytest nose)
                                              python-fill-column 99
                                              python-enable-yapf-format-on-save t
                                              python-sort-imports-on-save t
                                              )
                                      ipython-notebook
                                      ;; golang
                                      (go :variables
                                          gofmt-command "goimports"
                                          go-use-gometalinter t
                                          )

                                      ;; scala
                                      (scala :variables scala-auto-start-ensime t
                                             scala-indent:use-javadoc-style t)
                                      )
                                    )
