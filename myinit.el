;;;; SPEED UP EMACS ====================================
;; Decrease the number of garbage collection invocations
(setq gc-cons-threshold 10000000)
(add-hook 'emacs-startup-hook 'my/set-gc-threshold)
(defun my/set-gc-threshold ()
  "Reset `gc-cons-threshold' to its default value."
  (setq gc-cons-threshold 800000))
;;;; ==================================================
(setq mouse-wheel-scroll-amount '(3 ((shift) . 5)))

(use-package sr-speedbar
  :ensure t
  :defer t
  :init
  ;; Show tree on the left side
  (setq sr-speedbar-right-side nil)
  ;;(setq speedbar-show-unknown-files t)
  ;; Show all files
  ;; Bigger size (default is 24)
  (setq sr-speedbar-max-width 20)
  (setq sr-speedbar-width 20)
  ;;(setq speedbar-use-images t)
  (sr-speedbar-open)
  :config
  (with-current-buffer sr-speedbar-buffer-name
    (setq window-size-fixed 'width))
  )

(use-package smooth-scrolling
  :ensure t
  :config
  (progn
    (setq-default smooth-scroll-margin 2)
    (smooth-scrolling-mode)))

;; Toggle comment using C-M-/
(defun xah-comment-dwim ()
  "Like `comment-dwim', but toggle comment if cursor is not at end of line."
  (interactive)
  (if (region-active-p)
      (comment-dwim nil)
    (let ((-lbp (line-beginning-position))
          (-lep (line-end-position)))
      (if (eq -lbp -lep)
          (progn
            (comment-dwim nil))
        (if (eq (point) -lep)
            (progn
              (comment-dwim nil))
          (progn
            (comment-or-uncomment-region -lbp -lep)
            (forward-line )))))))
(global-set-key (kbd "C-M-/") 'xah-comment-dwim)

(setq inhibit-startup-message t)
(tool-bar-mode -1)
(cua-mode t)
;;(speedbar 1)

(global-visual-line-mode 1)
(global-set-key (kbd "<f5>") 'revert-buffer)

(tooltip-mode 0)
(setq tooltip-use-echo-area t)
;; Display paren (highlight matching brackets)
(show-paren-mode 1)
(setq show-paren-delay 0)
;; Display line number when programming
(add-hook 'prog-mode-hook 'linum-mode)
(fset 'yes-or-no-p 'y-or-n-p)
(setq user-full-name "Do Hong Son"
			user-mail-address "sonstephendo@gmail.com")
(set-face-attribute 'default nil
                    :family "Source Code Pro"
                    :height 128
                    :weight 'normal
                    :width 'normal)

(use-package undo-tree
:ensure t
:init
(global-undo-tree-mode))

(use-package flycheck
  :ensure t
  :commands flycheck-mode
  :init
  (add-hook 'c++-mode-hook 'flycheck-mode)
  (add-hook 'c-mode-hook 'flycheck-mode))

(use-package flycheck-irony
  :ensure t
  :commands flycheck-irony-setup
  :init
  (add-hook 'c++-mode-hook 'flycheck-irony-setup)
  (add-hook 'c-mode-hook 'flycheck-irony-setup))

(use-package yasnippet
	:ensure t
	:init
	(yas-global-mode 1))

;;CC spacing
(require 'cc-mode)
(setq-default c-basic-offset 4 c-default-style "linux")
(setq-default tab-width 4 indent-tabs-mode t)
(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)

;; auto close bracket insertion. New in emacs 24
(electric-pair-mode 1)

(use-package try
:ensure t)

(use-package org
  :ensure org-plus-contrib
)

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package color-theme
:ensure t)

(use-package base16-theme
	:ensure t)

(use-package moe-theme
	:ensure t)

(use-package eziam-theme
	:ensure t)

(use-package alect-themes
	:ensure t)

(moe-light)
(use-package powerline
	:ensure t
	:config
	(powerline-moe-theme))

(global-set-key (kbd "C-x C-b") 'ibuffer)
(setq ibuffer-saved-filter-groups
      (quote (("default"
	       ("dired" (mode . dired-mode))
	       ("org" (name . "^.*org$"))

	       ("web" (or (mode . web-mode) (mode . js2-mode)))
	       ("shell" (or (mode . eshell-mode) (mode . shell-mode)))
	       ("mu4e" (or

               (mode . mu4e-compose-mode)
               (name . "\*mu4e\*")
               ))
	       ("programming" (or
			       (mode . python-mode)
			       (mode . c-mode)
			       (mode . c++-mode)))
	       ("emacs" (or
			 (name . "^\\*scratch\\*$")
			 (name . "^\\*Messages\\*$")))
	       ))))
(add-hook 'ibuffer-mode-hook
	  (lambda ()
	    (ibuffer-auto-mode 1)
	    (ibuffer-switch-to-saved-filter-groups "default")))

;; don't show these
					;;(add-to-list 'ibuffer-never-show-predicates "zowie")
;; Don't show filter groups if there are no buffers in that group
(setq ibuffer-show-empty-filter-groups nil)

;; Don't ask for confirmation to delete marked buffers
(setq ibuffer-expert t)

(use-package tabbar
  :ensure t
  :config (tabbar-mode 1)
  )

(defalias 'redo 'undo-tree-redo)
(global-set-key (kbd "C-z") 'undo) ;; (Ctrl+z)
(global-set-key (kbd "C-y") 'redo) ;; (Ctrl+y); 

  ;; Highlights the current cursor line
  (global-hl-line-mode t)
  
  ;; deletes all the whitespace when you hit backspace or delete
  (use-package hungry-delete
  :ensure t
  :config
  (global-hungry-delete-mode))
  
  ;; expand the marked region in semantic increments (negative prefix to reduce region)
  (use-package expand-region
  :ensure t
  :config 
  (global-set-key (kbd "C-=") 'er/expand-region))

(setq save-interprogram-paste-before-kill t)

(use-package counsel
  :ensure t
  :bind
  (("M-y" . counsel-yank-pop)
   :map ivy-minibuffer-map
   ("M-y" . ivy-next-line))
  )

 (use-package ivy
  :ensure t
  :diminish (ivy-mode)
  :bind (("C-x b" . ivy-switch-buffer))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-display-style 'fancy))

(use-package swiper
  :ensure t
  :bind (("C-s" . swiper)
	 ("C-r" . ivy-resume)
	 ("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file))
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
	(setq ivy-display-style 'fancy)
   ;; space for paste
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
    ))

;; Multiple Cursors
(use-package multiple-cursors
  :ensure t
)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->")  'mc/mark-next-like-this)
(global-set-key (kbd "C-<")  'mc/mark-previous-like-this)
(global-set-key (kbd "C-* C-*")  'mc/mark-all-like-this)
(global-set-key (kbd "C-S-<down-mouse-1>")  'mc/add-cursor-on-click)



(use-package which-key
	:ensure t 
	:config
	(which-key-mode))

;;ggtags source code navigation
(use-package ggtags
	:ensure t
	:config 
	(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1))))
)

(use-package smartparens
:ensure t
:config
(use-package smartparens-config)
(use-package smartparens-html)
(use-package smartparens-python)
(use-package smartparens-latex)
(smartparens-global-mode t)
(show-smartparens-global-mode t)
:bind
( ("C-<down>" . sp-down-sexp)
 ("C-<up>"   . sp-up-sexp)
 ("M-<down>" . sp-backward-down-sexp)
 ("M-<up>"   . sp-backward-up-sexp)
("C-M-a" . sp-beginning-of-sexp)
 ("C-M-e" . sp-end-of-sexp)



 ("C-M-f" . sp-forward-sexp)
 ("C-M-b" . sp-backward-sexp)

 ("C-M-n" . sp-next-sexp)
 ("C-M-p" . sp-previous-sexp)

 ("C-S-f" . sp-forward-symbol)
 ("C-S-b" . sp-backward-symbol)

 ("C-<right>" . sp-forward-slurp-sexp)
 ("M-<right>" . sp-forward-barf-sexp)
 ("C-<left>"  . sp-backward-slurp-sexp)
 ("M-<left>"  . sp-backward-barf-sexp)

 ("C-M-t" . sp-transpose-sexp)
 ("C-M-k" . sp-kill-sexp)
 ("C-k"   . sp-kill-hybrid-sexp)
 ("M-k"   . sp-backward-kill-sexp)
 ("C-M-w" . sp-copy-sexp)

 ("C-M-d" . delete-sexp)

 ("M-<backspace>" . backward-kill-word)
 ("C-<backspace>" . sp-backward-kill-word)
 ([remap sp-backward-kill-word] . backward-kill-word)

 ("M-[" . sp-backward-unwrap-sexp)
 ("M-]" . sp-unwrap-sexp)

 ("C-x C-t" . sp-transpose-hybrid-sexp)

 ("C-c ("  . wrap-with-parens)
 ("C-c ["  . wrap-with-brackets)
 ("C-c {"  . wrap-with-braces)
 ("C-c '"  . wrap-with-single-quotes)
 ("C-c \"" . wrap-with-double-quotes)
 ("C-c _"  . wrap-with-underscores)
("C-c `"  . wrap-with-back-quotes)
))

;;--------------------------------------------

;; == irony-mode ==
(use-package irony
  :ensure t
  :defer t
  :init
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'objc-mode-hook 'irony-mode)
  :config
  ;; replace the `completion-at-point' and `complete-symbol' bindings in
  ;; irony-mode's buffers by irony-mode's function
  (defun my-irony-mode-hook ()
    (define-key irony-mode-map [remap completion-at-point]
      'irony-completion-at-point-async)
    (define-key irony-mode-map [remap complete-symbol]
      'irony-completion-at-point-async))
  (add-hook 'irony-mode-hook 'my-irony-mode-hook)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
  )

;; == company-mode ==
(use-package company
  :ensure t
  :defer t
  :init (add-hook 'after-init-hook 'global-company-mode)
  :bind ("<backtab>" . company-complete)
  :config
  (use-package company-irony :ensure t :defer t)
  (setq company-idle-delay              0.1
	company-minimum-prefix-length   2
	company-show-numbers            t
	company-tooltip-limit           20
	company-dabbrev-downcase        nil
	company-backends                '((company-irony company-gtags))
	)
  :bind ("C-SPC " . company-complete-common)
  )

(use-package company-c-headers
  :ensure t
  :config
  (add-to-list 'company-backends 'company-c-headers))

;; unset C- and M- digit keys
(dotimes (n 10)
  (global-unset-key (kbd (format "C-%d" n)))
  (global-unset-key (kbd (format "M-%d" n)))
  )
(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-x C-z"))
(global-auto-revert-mode t)
(add-hook 'c-mode-common-hook
  (lambda()
    (local-set-key (kbd "C-2") 'hs-show-block)
    (local-set-key (kbd "C-1")  'hs-hide-block)
    (local-set-key (kbd "C-4")    'hs-hide-all)
    (local-set-key (kbd "C-3")  'hs-show-all)
	(local-set-key [(shift mouse-2)] 'hs-mouse-toggle-hiding)
    (hs-minor-mode t)))

(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t

 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t
 )
