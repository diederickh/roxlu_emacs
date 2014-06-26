(add-to-list 'load-path "~/.emacs.d/")

(load-theme 'wombat t)
(setq-default indent-tabs-mode nil)
(fset 'yes-or-no-p 'y-or-n-p)

(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq js-indent-level 2) ; also with JS we only want 2 indents

; no wordwrapping
(setq-default truncate-lines 1)

; show matching parens
(show-paren-mode 1)
(setq show-paren-delay 0)

; enable ido
; interactively do things
(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(setq ido-enable-last-directory-history t)
(setq ido-max-work-directory-list 100)
(setq ido-max-work-file-list 300)

; backups
(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.saves"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 16
   kept-old-versions 12
   version-control t)       ; use versions

; org
(require 'org-install)

; make sure that function arguments are nicely indented
; press C-c C-o, to see what syntax you can change
; (c-set-offset 'arglist-cont-nonempty '+)
(add-hook 'c-mode-hook
          (lambda ()
            (c-set-offset 'defun-block-intro 2)
            (c-set-offset 'statement-block-intro 2)
            (c-set-offset 'arglist-intro '+)
            (c-set-offset 'substatement-open '0)  ; brackets should be at same indentation level as the statements they open
            (c-set-offset 'arglist-cont-nonempty 'c-lineup-arglist-intro-after-paren)
            (c-toggle-hungry-state 1) ; delete to the next correct character when you delete a white-char
            (c-set-offset 'arglist-close 0)))

; indent case in switches
(setq c-offsets-alist '((case-label . 2)))


; cmake mode
(setq auto-mode-alist
      (append
       '(("CMakeLists\\.txt\\'" . cmake-mode))
       '(("\\.cmake\\'" . cmake-mode))
       auto-mode-alist))

(autoload 'cmake-mode "~/.emacs.d/cmake-mode.el" t)


; web mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))
