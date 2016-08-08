;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'package) 
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize) 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; smex and ido
(require 'smex)
(global-set-key (kbd "M-x") 'smex)

(require 'ido)
(ido-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SBCL and Slime
(require 'slime)
(setq inferior-lisp-program "/usr/bin/sbcl")
(setq slime-contribs '(slime-fancy))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; basic options
(require 'auto-complete)
(ac-config-default)
(setq ac-delay 0.01)

;; highlight matching parens
(setq show-paren-delay 0)
(show-paren-mode 1)

(defalias 'yes-or-no-p 'y-or-n-p)

;; backups
(setq backup-directory-alist `(("." . "~/.emacs-backups")))
(setq backup-by-copying t)

(setq inhibit-startup-message t)
(tool-bar-mode -1)
(menu-bar-mode -1)

(setq scroll-step            1
      scroll-conservatively  10000)

(setq tab-width 4)
(setq-default indent-tabs-mode nil)

(global-linum-mode t)

(defun highlight-todos ()
  (font-lock-add-keywords nil '(("\\<\\(FIXME\\|TODO\\|BUG\\)" 1 font-lock-warning-face t))))

(add-hook 'prog-mode-hook 'highlight-todos)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org mode
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-agenda-files (list "~/org-mode/TODO.org"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; c-mode
;;(setq c-default-style "k&r")
(setq c-default-style '((java-mode . "java") (awk-mode . "awk") (other . "user")))
(setq c-basic-offset 4)
(setq c-basic-indent 4)
;;(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; evil mode
(require 'evil-leader)
(global-evil-leader-mode)

(evil-leader/set-leader ",")
(evil-leader/set-key
  "w" 'save-buffer
  "," 'other-window
  "q" 'kill-this-buffer)

(require 'evil)
(evil-mode 1)

(require 'key-chord)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map  "jk" 'evil-normal-state)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; set by emacs
(custom-set-variables
 '(custom-enabled-themes (quote (darkokai)))
 '(tool-bar-mode nil))
(setq default-frame-alist
      '(font . "-misc-fixed-medium-r-normal--14-*-100-100-c-70-iso8859-1"))
