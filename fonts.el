(use-package faces
       :ensure nil
       :defer 0.1
       :custom
       (face-font-family-alternatives '(("Monospace")))
       :config
       (set-face-attribute 'default
                           nil
                           :family (caar face-font-family-alternatives)
                           :weight 'bold
                           :width 'semi-condensed
                           ;; (/ (* 19 (display-pixel-height)) (display-mm-height))
                           :height 115)
       (set-fontset-font "fontset-default" 'cyrillic
                         (font-spec :registry "iso10646-1" :script 'cyrillic)))
(defun keybindings-webmode()
  (let ((my-key-map (current-local-map)))
    (local-unset-key (kbd "C-j"))
    (define-key my-key-map (kbd "C-j") 'newline)
    ))

(use-package php-mode
  (add-hook 'php-mode-hook 'keybindings-webmode))
