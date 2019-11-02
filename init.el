;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/ergoemacs-mode")
(require 'ergoemacs-mode)
(setq ergoemacs-theme nil)
(setq ergoemacs-keyboard-layout "us")
(ergoemacs-mode 1)
(tool-bar-mode -1)
(add-to-list 'load-path "~/.emacs.d/")
;; (require 'keybindings)
(require 'linum+)
(setq linum-format " %d ")
(global-linum-mode t)
(setq show-paren-style 'expression)
(show-paren-mode 2)
(setq make-backup-files nil)
(setq auto-save-list-file-name nil)
(setq auto-save-default t)

;; IDO Plugin which is also built-in
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)
;; New Line key-binding
(global-unset-key (kbd "C-j"))
(global-unset-key (kbd "M-a"))
(global-set-key (kbd "M-a") 'execute-extended-command)
(global-set-key (kbd "C-j") 'newline)
(global-set-key (kbd "C-c m") 'set-mark-command)
;; (global-set-key (kbd "M-a") (lambda() (interactive) (execute-extended-command "")))
;; (global-set-key (kbd "M-j") 'backward-char)

;; Buffer Show - BS - built-in
(require 'bs)
(global-set-key (kbd "<f2>") 'bs-show)
;; Setting configurations to enable **scratch** in buffer list
(setq bs-configurations
      '(("files" "^\\*scratch\\*" nil nil bs-visits-non-file bs-sort-buffer-interns-are-last)))

;; Auto-Complete SUPER IMPORTANT PLUGIN !
(add-to-list 'load-path "~/.emacs.d/auto-complete/")
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/dict")

;; Speed Bar stuff
(require 'sr-speedbar)
(global-unset-key (kbd "<f12>"))
(global-set-key (kbd "<f12>") 'sr-speedbar-toggle)

;; YASnippet (awesome stuff)
(add-to-list 'load-path "~/.emacs.d/yasnippet/")
(require 'yasnippet)
(yas-global-mode t)
(setq yas/triggers-in-field t)
;; (yas-minor-mode -1)
(yas/load-directory "~/.emacs.d/yasnippet/snippets")
;; Color Theme stuff
(add-to-list 'load-path "~/.emacs.d/color-theme")
(require 'color-theme)
(color-theme-initialize)
(setq color-theme-is-global t)
(color-theme-robin-hood)

;; Set default font "Monospace Bold" with the size of 11
(set-default-font "Monospace Bold 11")

;; Projectile stuff
(add-to-list 'load-path "~/.emacs.d/projectile")
(require 'projectile)
(projectile-mode t)
(toggle-truncate-lines t)

;; Special mini-plugins; For special use
(add-to-list 'load-path "~/.emacs.d/custom-plugins")
(require 'php-tricky)
(global-set-key (kbd "C-x RET") 'auto-go)
(global-set-key (kbd "C-c e") 'end-of-line)
;; Key configs for PROJECTILE 
(global-set-key (kbd "C-c p f") 'projectile-find-file)
(global-set-key (kbd "C-c p g") 'projectile-grep)
(global-set-key (kbd "C-c p r") 'projectile-replace)
(global-set-key (kbd "C-c r p") 'projectile-regenerate-tags)

;; Now for tags
(global-set-key (kbd "<f3>") 'visit-tags-table)
(global-set-key (kbd "M-.") 'find-tag)
(global-set-key (kbd "C-M-.") 'pop-tag-mark)

;; Bookmarks requiring
(global-unset-key (kbd "C-b"))
(global-unset-key (kbd "M-b"))
(global-unset-key (kbd "<f4>"))
(global-set-key (kbd "C-b") 'bookmark-set)
(global-set-key (kbd "M-b") 'bookmark-jump)
(global-set-key (kbd "<f4>") 'bookmark-bmenu-list)

;; Dabbrev expand stuff
;; It's for "we can say 'auto-expander' " and it's actually useful for every emacs user-developer
(global-unset-key (kbd "M-/"))
(global-set-key (kbd "M-/") 'dabbrev-expand)

;; Web Mode
(add-to-list 'load-path "~/.emacs.d/web-mode")
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(setq web-mode-code-indent-offset 4)
(setq web-mode-extra-auto-pairs
      '(("erb"  . (("beg" "end")))
        ("php"  . (("beg" "end")
                   ("beg" "end")))
       ))
(web-mode-prog-mode)
(defun keybindings-webmode()
  (let ((my-key-map (current-local-map)))
    (local-unset-key (kbd "C-j"))
    (define-key my-key-map (kbd "C-j") 'execute-extended-command)
    ))
;; Litable mode
(add-to-list 'load-path "~/.emacs.d/litable")
;; (add-to-list 'load-path "~/.emacs.d/dash")
(require 'litable)
;; (litable-mode t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (undo-tree use-package sr-speedbar flycheck org-link-minor-mode company-php ac-php vue-mode php-mode php-refactor-mode magit diff-hl chess))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
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
(add-hook 'php-mode-hook 'keybindings-webmode)
(global-diff-hl-mode t)
(setq org-todo-keywords '((sequence "TODO" "PUSH" "|" "DONE" "PUSHED")))
