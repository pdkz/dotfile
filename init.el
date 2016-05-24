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
