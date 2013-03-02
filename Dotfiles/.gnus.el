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
;;如果需要inline显示msword则需要安装"wv"和"w3m"软件包，然后在~/.mailcap文件中添加如下内容：
;;
;; #Multimedia
;; audio/*;smplayer %s; copiousoutput;
;; video/*; smplayer %s; copiousoutput;

;; #text/plain; emacsclient -c %s;
;; #text/plain; vim;

;; text/html; w3m -I %{charset} -T text/html; copiousoutput;

;; image/*; feh %s; copiousoutput

;; application/msword; wvHtml --charset=gb2312 %s - | w3m -dump -I %{charset} \
;;   -T text/html; copiousoutput;

;; application/pdf; foxitreader %s;
;; application/pdf; pdftotext %s -; copiousoutput

;; application/x-tar; tar xvf %s;
;; application/rar; unrar x %s;
;; application/zip; unzip %s;
;; application/bzip2; bunzip2 %s;
