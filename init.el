(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(require 'org)
;(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))
(org-babel-load-file (expand-file-name "~/.emacs.d/my_configuration.org"))


;(org-babel-load-file (expand-file-name "~/.emacs.d/java-lsp.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   '("~/Desktop/Everything/Others/LN-Manga Recommendations.org"))
 '(package-selected-packages
   '(lorem-ipsum multi-web-mode bufler quelpa-use-package multi-vterm lsp-treemacs helm helm-lsp dap-mode hydra lsp-mode projectile pulseaudio-control undo-tree wallpaper auto-complete all-the-icons-ivy fly-checker smex yasnippet which-key vterm visual-fill-column use-package tree-sitter-langs rainbow-delimiters org-tree-slide org-bullets lsp-ui lsp-java lsp-ivy hungry-delete hide-mode-line helpful general flymake-grammarly flycheck-grammarly exwm expand-region evil-collection eglot doom-themes doom-modeline desktop-environment counsel company-box command-log-mode all-the-icons-ivy-rich ac-etags)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
