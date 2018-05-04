;;;  -*- lexical-binding: t; -*-

;; git

(def-package! magit-gitflow
  :init (add-hook 'magit-mode-hook 'turn-on-magit-gitflow)
  :after magit)

(provide 'config)
