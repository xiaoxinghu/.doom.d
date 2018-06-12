;;;  -*- lexical-binding: t; -*-

(map! :leader
      (:desc "file" :prefix "f"
        :desc "Delete file" :n "D" #'doom/delete-this-file))
