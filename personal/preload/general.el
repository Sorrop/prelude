(require 'prelude-packages)

(defvar package-list '(clojure-mode
		       paredit
		       rainbow-delimiters
		       aggressive-indent
		       cider
		       gruvbox-theme))

(prelude-require-packages package-list)

;; choose a theme
;;(setq prelude-theme 'sanityinc-tomorrow-bright)
(setq prelude-theme 'gruvbox)

;; mode line config
(add-to-list 'load-path "~/.emacs.d/vendor/emacs-powerline")
(require 'powerline)
(setq powerline-arrow-shape 'curve)

;; Minor modes for clojure development
(add-hook 'clojure-mode-hook #'paredit-mode)
(add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook #'aggressive-indent-mode)


;; These settings relate to how emacs interacts with your operating system
(setq ;; makes killing/yanking interact with the clipboard
      x-select-enable-clipboard t

      ;; I'm actually not sure what this does but it's recommended?
      x-select-enable-primary t

      ;; Save clipboard strings into kill ring before replacing them.
      ;; When one selects something in another program to paste it into Emacs,
      ;; but kills something in Emacs before actually pasting it,
      ;; this selection is gone unless this variable is non-nil
      save-interprogram-paste-before-kill t

      ;; Shows all options when running apropos. For more info,
      ;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Apropos.html
      apropos-do-all t

      ;; Mouse yank commands yank at point instead of at click.
      mouse-yank-at-point t)

;; No cursor blinking, it's distracting
(blink-cursor-mode 0)

;; full path in title bar
(setq-default frame-title-format "%b (%f)")

(when (fboundp 'tool-bar-mode)
   (tool-bar-mode -1))

;; Don't show native OS scroll bars for buffers because they're redundant
(when (fboundp 'scroll-bar-mode)
(scroll-bar-mode -1))

;; show line numbers
(global-linum-mode)


;;; Whitespace

;; Don't use tab character for indentation
(setq-default indent-tabs-mode nil)

;; Whitespace mode configuration
(setq whitespace-display-mappings '((newline-mark 10 [172 10])
                                    (space-mark 32 [183] [46])
                                    (tab-mark 9 [187 9] [92 9])))

;; Show trailing whitespace on programming modes
(add-hook 'prog-mode-hook (lambda () (setq show-trailing-whitespace t)))

;; cider repl config
(setq cider-repl-display-help-banner nil
      cider-repl-use-pretty-printing t)
(add-hook 'cider-repl-mode-hook #'eldoc-mode)
(add-hook 'cider-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c C-w") #'cider-eval-last-sexp-and-replace)))


;; Minor modes for lisp development
(add-hook 'lisp-mode-hook #'paredit-mode)
(add-hook 'lisp-mode-hook #'rainbow-delimiters-mode)
(add-hook 'lisp-mode-hook #'aggressive-indent-mode)


;; show matching parens highlighting
(show-paren-mode 1)

(set-face-attribute 'default nil :height 140)


(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist `(,(rx ".js" string-end) . js2-mode))
(add-to-list 'auto-mode-alist `(,(rx ".jsx" string-end) . rjsx-mode))
;;(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . js2-jsx-mode))
(setq js-indent-level 2)
