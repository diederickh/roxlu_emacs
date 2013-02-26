(setq tab-width 2)
(setq-default indent-tabs-mode nil)
(setq indent-tabs-mode nil)
(setq-default truncate-lines t) ; no line wrapping
(fset 'yes-or-no-p 'y-or-n-p)

(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(setq ido-enable-last-directory-history t)
(setq ido-max-work-directory-list 100)
(setq ido-max-work-file-list 300)

; backups
; (setq
;    backup-by-copying t      ; don't clobber symlinks
;    backup-directory-alist
;     '(("." . "~/.saves"))    ; don't litter my fs tree
;    delete-old-versions t
;    kept-new-versions 6
;    kept-old-versions 2
;    version-control t)       ; use versioned backups
