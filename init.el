; auto-complete: version 1.3.1
; nxhtml: from github revision: 8e31184fb5d621a162e8bc57953d93091f650b1a
; zenburn color theme: cd .emacs.d && mkdir themes && cd themes && git clone https://github.com/bbatsov/zenburn-emacs.git  .
; cmake-mode: http://www.cmake.org/CMakeDocs/cmake-mode.el

; coding / text editing
(setq tab-width 2)

;(setq basic-offset 2)
(setq-default indent-tabs-mode nil)
;(setq-default c-basic-offset 2
;              tab-width 2
;              indent-tabs-mode 0)

(setq js-indent-level 2)
(setq indent-tabs-mode nil)
(setq-default truncate-lines t) ; no line wrapping

; make sure that function arguments are nicely indented
; press C-c C-o, to see what syntax you can change
; (c-set-offset 'arglist-cont-nonempty '+)
(add-hook 'c-mode-hook
          (lambda ()
            (c-set-offset 'defun-block-intro 2)
            (c-set-offset 'statement-block-intro 2)
            (c-set-offset 'arglist-intro '+)
            (c-set-offset 'arglist-cont-nonempty 'c-lineup-arglist-intro-after-paren)
            (c-set-offset 'arglist-close 0)))

; (setq-default arglist-cont-nonempty 'c-lineup-arglist-intro-after-paren)

; indent cases labels
(setq c-offsets-alist '((case-label . 2)))

; color / themes
(load-theme 'wombat t)

; backups
(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.saves"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups

(fset 'yes-or-no-p 'y-or-n-p)

; show matching parenthesis
(show-paren-mode 1)
(setq show-paren-delay 0)

; interactively do things
(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(setq ido-enable-last-directory-history t)
(setq ido-max-work-directory-list 100)
(setq ido-max-work-file-list 300)

; idomenu, jump through functions
(autoload 'idomenu "idomenu" nil t)
(global-set-key (kbd "C-x =") 'idomenu)

; org
(require 'org-install)

; auto complete
(add-to-list 'load-path "~/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

; nxhtml 
;(load "~/.emacs.d/nxhtml/autostart.el")
;(setq mumamo-background-colors nil) ;no wierd chunked coloring

(require 'php-mode)

; cmake mode
(setq auto-mode-alist
      (append
       '(("CMakeLists\\.txt\\'" . cmake-mode))
       '(("\\.cmake\\'" . cmake-mode))
       auto-mode-alist))

(autoload 'cmake-mode "~/.emacs.d/cmake-mode.el" t)
 
; Switching between windows 
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))


(autoload 'glsl-mode "glsl-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.vert\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.frag\\'" . glsl-mode))
