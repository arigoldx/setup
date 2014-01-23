(setq confirm-kill-emacs 'yes-or-no-p)
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/emacs-goodies-el/")

;;; breadcrumbs
(require 'breadcrumb)
(global-set-key (kbd "ESC C-S-SPC")           'bc-set)            ;; Shift-SPACE for set bookmark
;(global-set-key (kbd "S-SPC")           'bc-set)            ;; Shift-SPACE for set bookmark
(global-set-key [(meta j)]              'bc-previous)       ;; M-j for jump to previous
(global-set-key [(shift meta j)]        'bc-next)           ;; Shift-M-j for jump to next
(global-set-key (kbd "ESC <up>")        'bc-local-previous) ;; M-up-arrow for local previous
(global-set-key (kbd "ESC <down>")      'bc-local-next)     ;; M-down-arrow for local next
(global-set-key [(control c)(j)]        'bc-goto-current)   ;; C-c j for jump to current bookmark
(global-set-key [(control x)(meta j)]   'bc-list)           ;; C-x M-j for the bookmark menu list


;;; ECB
(add-to-list 'load-path "/home/ari/.emacs.d/ecb")
(require 'ecb)

(global-set-key (kbd "C-c C-c") 'hs-toggle-hiding)

; auto-complete-mode

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
; Use dictionaries by default
(setq-default ac-sources (add-to-list 'ac-sources 'ac-source-dictionary))
(global-auto-complete-mode t)
; case sensitivity is important when finding matches
(setq ac-ignore-case nil)
(ac-config-default)

;;; maybe one day this will work.  i think it's broken due to our using
;;; node 0.6.21 --- since we're going to switch i'm just going to wait.
;;; all this does is syntax checking which isn't that big a deal
;;;
;;;  JSLINT
;;
;;(add-to-list 'load-path "~/.emacs.d/lintnode")
;;(require 'flymake-jslint)
;;;; Make sure we can find the lintnode executable
;;(setq lintnode-location "~/.emacs.d/lintnode")
;;;; JSLint can be... opinionated
;;(setq lintnode-jslint-excludes (list 'nomen 'plusplus 'onevar 'white))
;;;; Start the server when we first open a js file and start checking
;;(add-hook 'js-mode-hook
;;          (lambda ()
;;            (lintnode-hook)))

; js2-mode
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

; code folding
(add-hook 'js-mode-hook
          (lambda ()
            ;; Scan the file for nested code blocks
            (imenu-add-menubar-index)
            ;; Activate the folding mode
            (hs-minor-mode t)))
	
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-charcoal-black)))

;; an attempt as saving the *scratch* buffer.  code from:
;; http://dorophone.blogspot.com/2011/11/how-to-make-emacs-scratch-buffer.html
;;
;; broken but also has a big design problem:
;; - doesn't save all the time, just on exit
;;
;;(defvar persistent-scratch-filename
;;  "~/.emacs-persistent-scratch"
;;  "Location of *scratch* file contents for persistent-scratch.")
;;
;;(defvar persistent-scratch-backup-directory
;;  "~/.emacs-persistent-scratch-backups/"
;;  "Location of backups of the *scratch* buffer contents for
;;persistent-scratch.")
;;
;;(defun make-persistent-scratch-backup-name ()
;;  "Create a filename to backup the current scratch file by
;;  concatenating PERSISTENT-SCRATCH-BACKUP-DIRECTORY with the
;;  current date and time."
;;  (concat
;;   persistent-scratch-backup-directory
;;   (replace-regexp-in-string
;;    (regexp-quote " ") "-" (current-time-string))))
;;
;;(defun save-persistent-scratch ()
;;  "Write the contents of *scratch* to the file name
;;PERSISTENT-SCRATCH-FILENAME, making a backup copy in
;;  PERSISTENT-SCRATCH-BACKUP-DIRECTORY."
;;  (with-current-buffer (get-buffer "*scratch*")
;;    (if (file-exists-p persistent-scratch-filename)
;;	(copy-file persistent-scratch-filename
;;		   (make-persistent-scratch-backup-name)))
;;    (write-region (point-min) (point-max)
;;		  persistent-scratch-filename)))
;;
;;(defun load-persistent-scratch ()
;;  "Load the contents of PERSISTENT-SCRATCH-FILENAME into the scratch
;;  buffer, clearing its contents first."
;;  (if (file-exists-p persistent-scratch-filename)
;;      (with-current-buffer (get-buffer "*scratch*")
;;	(delete-region (point-min) (point-max))
;;	(shell-command (format "cat %s" persistent-scratch-filename)
;;  (current-buffer)))))
;;
;;(load-persistent-scratch)
;;
;;(push #'save-persistent-scratch kill-emacs-hook)\
;;
;;(remove-hook 'kill-emacs-hook 'save-persistent-scratch)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-layout-name "left9")
 '(ecb-layout-window-sizes (quote (("left9" (ecb-methods-buffer-name 0.20212765957446807 . 0.9787234042553191)))))
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--C-mouse-1))
 '(safe-local-variable-values (quote ((eval auto-fill-mode) (eval outline-mode))))
 '(tab-width 4)
 '(transient-mark-mode (quote (only . t))))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "Grey15" :foreground "Grey" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))
(put 'downcase-region 'disabled nil)
