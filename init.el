(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq indent-tabs-mode nil)
(setq-default truncate-lines t) ; no line wrapping
(setq c-offsets-alist '((case-label . 2)))
(fset 'yes-or-no-p 'y-or-n-p)
(show-paren-mode 1) ; show matching parenthesis
(setq show-paren-delay 0) ; show matching parenthesis
(require 'ido) ; interactively do things
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(setq ido-enable-last-directory-history t)
(setq ido-max-work-directory-list 100)
(setq ido-max-work-file-list 300)
(require 'org-install)

; backups
(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.saves"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups


; auto complete
(add-to-list 'load-path "~/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

(require 'php-mode)

; cmake mode
(setq auto-mode-alist
      (append
       '(("CMakeLists\\.txt\\'" . cmake-mode))
       '(("\\.cmake\\'" . cmake-mode))
       auto-mode-alist))

(autoload 'cmake-mode "~/.emacs.d/cmake-mode.el" t)
 
