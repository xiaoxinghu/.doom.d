;;;  -*- lexical-binding: t; -*-

(load! "+bindings")

;; git

(def-package! magit-gitflow
  :init (add-hook 'magit-mode-hook 'turn-on-magit-gitflow)
  :after magit)

;; org
(after! org
  (setq org-directory "~/io"
        org-agenda-files (list org-directory
                               (concat org-directory "/notes")
                               (concat org-directory "/work")
                               (concat org-directory "/projects"))))

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
