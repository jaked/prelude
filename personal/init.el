(add-to-list 'auto-mode-alist '("\\.strato\\'" . scala-mode))

(defun open-cgit ()
  "Open cgit.twitter.biz link to current file at current line"
  (interactive)
  (let* ((filename (buffer-file-name))
         (git-root (directory-file-name (expand-file-name (vc-git-root filename))))
         (path (substring filename (length git-root)))
         (repo (file-name-nondirectory git-root))
         (lineno (number-to-string (line-number-at-pos))))
    (browse-url (concat "https://cgit.twitter.biz/" repo "/tree" path "#n" lineno))))

(defun open-code ()
  "Open code.twitter.biz link to current file at current line"
  (interactive)
  (let* ((filename (buffer-file-name))
         (git-root (directory-file-name (expand-file-name (vc-git-root filename))))
         (path (substring filename (length git-root)))
         (repo (file-name-nondirectory git-root))
         (lineno (number-to-string (line-number-at-pos))))
    (browse-url (concat "https://code.twitter.biz/twitter/" repo "@master/.tree" path "#startline=" lineno))))

(defun open-phabricator ()
  "Open phabricator.twitter.biz link to current file at current line"
  (interactive)
  (let* ((filename (buffer-file-name))
         (git-root (directory-file-name (expand-file-name (vc-git-root filename))))
         (path (substring filename (length git-root)))
         (repo (file-name-nondirectory git-root))
         (lineno (number-to-string (line-number-at-pos))))
    (browse-url (concat "https://phabricator.twitter.biz/" repo "/" repo "/browse/master" path "$" lineno))))

(defun scalafmt ()
  "scalafmt a buffer"
  (interactive)
  (setenv "NAILGUN_PORT" "63537")
  (save-excursion
    (call-process-region
     (point-max)
     (point-min)
     "/opt/twitter/bin/ng" t t nil
     "scalafmt"
     "--non-interactive"
     "--config" "/Users/jdonham/workspace/source/.scalafmt.conf"
     "--stdin")))

(server-start)
