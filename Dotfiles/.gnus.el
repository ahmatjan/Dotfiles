(setq user-full-name "Zhang Jun")
(setq user-mail-address "geekard@qq.com")

;(setq gnus-select-method '(nntp "news.gmane.org"))
;(setq gnus-select-method '(nntp "geekard.uestc.edu.cn"))
(setq gnus-select-method '(nntp "localhost"))

(setq gnus-secondary-select-methods
      '((nnmaildir "Mail" (directory "~/Mail"))
;        (nntp "news.aioe.org")
        ))
(setq gnus-message-archive-group "nnmaildir+macro:outbox")
(setq message-sendmail-envelope-from 'header)
(setq mail-envelope-from 'header)
(setq message-send-mail-function 'message-send-mail-with-sendmail)
(setq sendmail-program "/usr/bin/msmtp")

(setq gnus-safe-html-newsgroups "\\`nntp[+:]news\\.gwene\\.org[+:]")

(setq gnus-posting-styles '((".*"
                             (signature-file "~/.signature")
                             (name "Zhang Jun")
   			     (address "geekard@qq.com"))
                            ("nnmaildir"
                             (From (with-current-buffer gnus-article-buffer
                                     (message-fetch-field "to"))))))

;;(add-hook 'gnus-after-getting-new-news-hook 'gnus-notifications)
