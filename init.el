; auto-complete: version 1.3.1
; nxhtml: from github revision: 8e31184fb5d621a162e8bc57953d93091f650b1a
; zenburn color theme: cd .emacs.d && mkdir themes && cd themes && git clone https://github.com/bbatsov/zenburn-emacs.git  .
; cmake-mode: http://www.cmake.org/CMakeDocs/cmake-mode.el

; coding / text editing
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; =================== Install packages ===========================

;; See http://cachestocaches.com/2015/8/getting-started-use-package/
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(use-package yasnippet
  :ensure t
  :init (add-hook 'prog-mode-hook #'yas-minor-mode)
  :config (yas-reload-all))

;; =================== Edit ===========================

(setq-default tab-width 2)
(setq column-number-mode t)
(setq-default indent-tabs-mode nil)

(setq js-indent-level 2)
(setq js-switch-indent-offset 2)

(setq indent-tabs-mode nil)
(setq-default truncate-lines t) ; no line wrapping

; js2 mode.
(add-hook 'js2-mode-hook (lambda () (setq js2-basic-offset 2)))
(setq js2-mode-show-parse-errors nil)
(setq js2-mode-show-strict-warnings nil)
(setq js2-indent-switch-body 2)
(add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'js2-mode))

; make sure that function arguments are nicely indented
; press C-c C-o, to see what syntax you can change
(add-hook 'c-mode-hook
          (lambda ()
            (c-set-offset 'defun-block-intro 2)
            (c-set-offset 'statement-block-intro 2)
            (c-set-offset 'arglist-intro '+)
            (c-set-offset 'arglist-cont-nonempty 'c-lineup-arglist-intro-after-paren)
            (c-set-offset 'arglist-close 0)))

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
   kept-new-versions 16
   kept-old-versions 12
   version-control t)       ; use versioned backups

(fset 'yes-or-no-p 'y-or-n-p)

; show matching parenthesis
(show-paren-mode 1)
(setq show-paren-delay 0)

; interactively do things
(require 'ido)
(ido-mode 1)
; (setq ido-use-virtual-buffers t) ; I didn't really like this in the end.
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-enable-last-directory-history t)
(setq ido-max-work-directory-list 1000)
(setq ido-max-work-file-list 3000)

; idomenu, jump through functions
(autoload 'idomenu "idomenu" nil t)
(global-set-key (kbd "C-x =") 'idomenu)

; org
(require 'org-install)

; c++
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

; php
(autoload 'php-mode "~/.emacs.d/php-mode.el" t)
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))

; web
(autoload 'web-mode "~/.emacs.d/web-mode.el" t)
(add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)

; haxe
(add-to-list 'auto-mode-alist '("\\.hx\\'" . javascript-mode))

; css
(add-to-list 'auto-mode-alist '("\\.css\\'" . css-mode))
(add-to-list 'auto-mode-alist '("\\.less\\'" . css-mode))
(setq css-indent-offset 2)

; cmake mode
(autoload 'cmake-mode "~/.emacs.d/cmake-mode.el" t)
(add-to-list 'auto-mode-alist '("CMakeLists\\.txt\\'" . cmake-mode))
(add-to-list 'auto-mode-alist '("\\.cmake\\'" . cmake-mode))
 
; Switching between windows 
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(autoload 'glsl-mode "glsl-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.vert\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.frag\\'" . glsl-mode))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(package-selected-packages (quote (auto-complete-c-headers auto-complete)))
 '(safe-local-variable-values (quote ((intent-tabs-mode))))
 '(send-mail-function nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bold ((t (:foreground "brightred" :weight bold))))
 '(font-lock-comment-face ((t (:foreground "brightgreen"))))
 '(org-block ((t (:inherit shadow :foreground "brightgreen"))))
 '(org-block-begin-line ((t (:inherit org-meta-line))) t)
 '(org-code ((t (:inherit shadow :foreground "brightgreen")))))
(put 'set-goal-column 'disabled nil)

;; quickly jump to a column
(global-set-key (kbd "C-x j") (lambda () (interactive) (move-to-column 115 t)))

;; move characters to column
(global-set-key (kbd "C-x m")(lambda()  (interactive) (while (< (current-column) 115) (insert " "))))

;; Melpa packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

;; Magit git (install with "M-x package-install [RET] magit [RET]
(global-set-key (kbd "C-x g") 'magit-status)

;; IRC
(setq erc-nick "roxlu")

;; Custom key binding to jump to start and end of functions
(global-set-key (kbd "M-s a") 'beginning-of-defun)    ; press ALT + S, then A - go to begin of function
(global-set-key (kbd "M-s e") 'end-of-defun)          ; press ALT + S, then E - go to end of function

;; Indent one line comment in header files to column num. 100. */
(fset 'indent-comment
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("/xindent-doto-column100" 0 "%d")) arg)))

(global-set-key (kbd "C-x c") 'indent-comment)     ; press CTRL + X, then C to execute the indent-comment func.

;; Make fullscreen on start (windows).


(prefer-coding-system 'utf-8)
(setq-default buffer-file-coding-system 'utf-8-auto-unix)

;; yasnippet

(require 'yasnippet)
(yas-global-mode 1)

(setq org-src-fontify-natively t)

; Make sure that fill-paragraph fills out nicely.
(setq-default fill-column 80)

; Wanderlust Mail
; (autoload 'wl "wl" "Wanderlust" t)

; Cursor
(setq-default cursor-type `box)
(set-cursor-color "#00FF00")

