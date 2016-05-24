(add-to-list 'load-path "~/.emacs.d/auto-complete")
(add-to-list 'load-path "~/.emacs.d/popup")

;; Disable startup screen
(setq inhibit-startup-screen t)

;; Disable menue-bar(only NTEmacs/GnuEmacsforMac)
(tool-bar-mode -1)

;; Set repository
(setq package-archives 
  '(("gnu" . "http://elpa.gnu.org/packages/")
("marmalade" . "http://marmalade-repo.org/packages/")
("melpa" . "http://melpa.org/packages/")))

;; Color
(if window-system (progn
   (set-background-color "Black")
   (set-foreground-color "LightGray")
   (set-cursor-color "Gray")
   (set-frame-parameter nil 'alpha 80)
   ))

;; Line number(Cygwin only)
(require 'linum)
(global-linum-mode t)
(setq linum-format "%5d ")

;; Enable backspace key
(global-set-key "\C-h" 'delete-backward-char)

;; Set proxy(if use)
(setq url-proxy-services
      '(("http" . "proxyserver:port")
        ("https" . "proxyserver:port")))

;; Set font
(set-frame-font "ricty-9")

;; Set auto-complete
(require 'auto-complete)
(require 'auto-complete-config)
(require 'auto-complete-clang-async)
(ac-config-default)

(add-hook 'c++-mode-common-hook
          '(lambda()
             (setq ac-clang-complete-executable "~/.emacs.d/clang-complete")
             (setq ac-sources '(ac-source-clang-async))
             (ac-clang-launch-completion-process)))

(defun my-ac-config ()
  (global-set-key "\M-/" 'ac-start)
  ;; C-n/C-p で候補を選択
  (define-key ac-complete-mode-map "\C-n" 'ac-next)
  (define-key ac-complete-mode-map "\C-p" 'ac-previous)
  (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
  (add-hook 'c++-mode-common-hook 'ac-cc-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))
(my-ac-config)

;;ソースツリーにある.setings.elを読み込む
(defun recursive-load-dir-settings (currentfile)
  (let ((lds-dir (locate-dominating-file currentfile ".settings.el")))
    (when lds-dir
      (progn
        (load-file (concat lds-dir ".settings.el"))
        (recursive-load-dir-settings
         (file-truename(concat lds-dir "..")))))))

(defun load-dir-settings()
  (interactive)
  (when buffer-file-name
    (recursive-load-dir-settings buffer-file-name)))

(add-hook 'find-file-hook 'load-dir-settings)
