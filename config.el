;;;  -*- lexical-binding: t; -*-

(load! "+bindings")

;; git
(def-package! magit-gitflow
  :init (add-hook 'magit-mode-hook 'turn-on-magit-gitflow)
  :after magit)


;; org
(let* ((root "~/io")
       (inbox (concat root "/inbox.org"))
       (gtd (concat root "/gtd.org")))
  (setq
   org-directory root
   org-agenda-files (list inbox gtd)))

;;; default settings
(setq
   org-log-into-drawer 1
   org-archive-mark-done nil)

;;; capture
(setq org-capture-templates
      `(("t" "todo" entry
         (file+headline ,(concat org-directory "/inbox.org") "Tasks")
         (file , "~/.doom.d/templates/todo.txt")
         ::empty-lines-before 1
         ::empty-lines-after 1)
        ("n" "note" entry
         (file+headline ,(concat org-directory "/inbox.org") "Notes")
         (file , "~/.doom.d/templates/note.txt")
         ::empty-lines-before 1
         ::empty-lines-after 1)
        ("l" "link" entry
         (file+headline ,(concat org-directory "/inbox.org") "Notes")
         (file , "~/.doom.d/templates/link.txt")
         ::empty-lines-before 1
         ::empty-lines-after 1)
        ))

(after! org
  (map! :map evil-org-mode-map
        :localleader
        :n "l" #'x/org-insert-link-with-title)
  )


(after! js2-mode
  ;; javascript indent
  (setq-default
   ;; js2-mode
   js2-basic-offset 2
   js-indent-level 2
   ;; web-mode
   css-indent-offset 2
   web-mode-markup-indent-offset 2
   web-mode-css-indent-offset 2
   web-mode-code-indent-offset 2
   web-mode-attr-indent-offset 2)
  )

(provide 'config)
