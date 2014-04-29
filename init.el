(load-theme 'wombat t)
(setq-default indent-tabs-mode nil)
(fset 'yes-or-no-p 'y-or-n-p)

(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

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
            (c-toggle-hungry-state 1)
            (c-set-offset 'arglist-close 0)))

; indent case in switches
(setq c-offsets-alist '((case-label . 2)))
