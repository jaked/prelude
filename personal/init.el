(defun open-cgit ()
  "Open cgit.twitter.biz link to current file at current line"
  (interactive)
  (let* ((filename (buffer-file-name))
         (git-root (directory-file-name (expand-file-name (vc-git-root filename))))
         (path (substring filename (length git-root)))
         (repo (file-name-nondirectory git-root))
         (lineno (number-to-string (line-number-at-pos))))
    (browse-url (concat "https://cgit.twitter.biz/" repo "/tree" path "#n" lineno))))

(server-start)
