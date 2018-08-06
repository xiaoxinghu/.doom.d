;;;  -*- lexical-binding: t; -*-

(load! "+bindings")

;; git
(def-package! magit-gitflow
  :init (add-hook 'magit-mode-hook 'turn-on-magit-gitflow)
  :after magit)


;; org
(setq org-directory "~/io"
      org-inbox (concat org-directory "/inbox.org")
      org-gtd (concat org-directory "/gtd.org")
      org-agenda-files (list org-inbox org-gtd)
      org-log-into-drawer 1
      org-ellipsis " ▼ "
      org-archive-mark-done nil)

;;; capture
(setq org-capture-templates
      `(("t" "todo" entry
         (file+headline ,(concat org-directory "/inbox.org") "Tasks")
         "* TODO %?\n:LOGBOOK:\n- Added: %U\n:END:"
         ::empty-lines-before 1
         ::empty-lines-after 1)
        ("n" "note" entry
         (file+headline ,(concat org-directory "/inbox.org") "Notes")
         "* %^{description}\n:LOGBOOK:\n- Added: %U\n:END:\n\n%?"
         ::empty-lines-before 1
         ::empty-lines-after 1)
        ("l" "link" entry
         (file+headline ,(concat org-directory "/inbox.org") "Notes")
         "* %?\n:LOGBOOK:\n- Added: %U\n:END:\n%^L"
         ::empty-lines-before 1
         ::empty-lines-after 1)
        ))

(after! org
  (map! :map evil-org-mode-map
        :localleader
        :n "l" #'x/org-insert-link-with-title)
  )

;;; agenda
(setq org-agenda-custom-commands
      '((" " "My Agenda"
         ((agenda "" nil)
          (tags-todo "-pause+TODO=\"NEXT\""
                     ((org-agenda-overriding-header "NEXT")))
          (tags-todo "-pause+@work"
                     ((org-agenda-overriding-header "WORK")))
          ))
        ("r" "Review"
         ((todo "TODO"
                ((org-agenda-overriding-header "INBOX")
                 (org-agenda-files (list org-inbox))))
          (tags-todo "-pause+TODO=\"TODO\""
                     ((org-agenda-overriding-header "TODOs")
                      (org-agenda-files (list org-gtd))))
          (tags-todo "pause"
                     ((org-agenda-overriding-header "PAUSED")
                      (org-agenda-files (list org-gtd))))
          ))
        ("Q" . "Custom Queries")
        ("Qn" "Note Search" search ""
         ((org-agenda-files (file-expand-wildcards (concat org-directory "/notes/*.org")))))
        ))

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
