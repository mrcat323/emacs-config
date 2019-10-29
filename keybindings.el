;; Unsetting that hotkeys
(global-unset-key (kbd "M-a"))
(global-unset-key (kbd "M-d"))
(global-unset-key (kbd "M-w"))
(global-unset-key (kbd "M-s"))

;; Setting hotkeys for moving cursor
(global-set-key (kbd "M-a") 'backward-char)
(global-set-key (kbd "M-d") 'forward-char)
(global-set-key (kbd "M-w") 'previous-line)
(global-set-key (kbd "M-s") 'next-line)
(global-set-key (kbd "M-f") 'backward-delete-char)
