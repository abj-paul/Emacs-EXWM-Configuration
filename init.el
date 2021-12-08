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
 '(ansi-color-names-vector
   ["#282a36" "#ff5555" "#50fa7b" "#f1fa8c" "#61bfff" "#ff79c6" "#8be9fd" "#f8f8f2"])
 '(custom-safe-themes
   '("6ebdb33507c7db94b28d7787f802f38ac8d2b8cd08506797b3af6cdfd80632e0" "5c88ec54ed70300e964148e124460357116aa738c8b02af77378b58c446012dd" "957838c5ab481f5d406700441340035f384a79ba317bdc2f7836dcccd3f09a56" "1905b704347b33053b09307f0dd56e0485841e18b9b0cdd5e0fe2c27c528a3cc" "c5bff1f55de64157defb04d52fa734477fe46ce430c27029cf519af417256fb2" "663c7ac9cff519d4faad8f08330cb4f4049d4f1ae0b30609c181c5841986bc04" "f59de3ae0ceea8680e298601481d70d38bcafa2cde053f768630669ee4d1029b" "234dbb732ef054b109a9e5ee5b499632c63cc24f7c2383a849815dacc1727cb6" "fc5cde46faf927a7e97f812c11cfe9281491c54ad4dc7b052781c7fba93fed78" default))
 '(exwm-floating-border-color "#242530")
 '(fci-rule-color "#6272a4")
 '(highlight-tail-colors
   ((("#2c3e3c" "#2a3b2e" "green")
     . 0)
    (("#313d49" "#2f3a3b" "brightcyan")
     . 20)))
 '(jdee-db-active-breakpoint-face-colors (cons "#1E2029" "#bd93f9"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1E2029" "#50fa7b"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1E2029" "#565761"))
 '(objed-cursor-color "#ff5555")
 '(org-agenda-files
   '("~/Desktop/Everything/Others/LN-Manga Recommendations.org"))
 '(org-babel-load-languages '((ein . t) (ein . t) (ein . t) (emacs-lisp . t)))
 '(package-selected-packages
   '(org-pdftools ob-sagemath ob-mathomatic try magit autothemer ssh ob-shell marginalia ein htmlize ox-reveal lorem-ipsum multi-web-mode bufler quelpa-use-package multi-vterm lsp-treemacs helm helm-lsp dap-mode hydra lsp-mode projectile pulseaudio-control undo-tree wallpaper auto-complete all-the-icons-ivy fly-checker smex yasnippet which-key vterm visual-fill-column use-package tree-sitter-langs rainbow-delimiters org-tree-slide org-bullets lsp-ui lsp-java lsp-ivy hungry-delete hide-mode-line helpful general flymake-grammarly flycheck-grammarly exwm expand-region evil-collection eglot doom-themes doom-modeline desktop-environment counsel company-box command-log-mode all-the-icons-ivy-rich ac-etags))
 '(pdf-view-midnight-colors (cons "#f8f8f2" "#282a36"))
 '(rustic-ansi-faces
   ["#282a36" "#ff5555" "#50fa7b" "#f1fa8c" "#61bfff" "#ff79c6" "#8be9fd" "#f8f8f2"])
 '(vc-annotate-background "#282a36")
 '(vc-annotate-color-map
   (list
    (cons 20 "#50fa7b")
    (cons 40 "#85fa80")
    (cons 60 "#bbf986")
    (cons 80 "#f1fa8c")
    (cons 100 "#f5e381")
    (cons 120 "#face76")
    (cons 140 "#ffb86c")
    (cons 160 "#ffa38a")
    (cons 180 "#ff8ea8")
    (cons 200 "#ff79c6")
    (cons 220 "#ff6da0")
    (cons 240 "#ff617a")
    (cons 260 "#ff5555")
    (cons 280 "#d45558")
    (cons 300 "#aa565a")
    (cons 320 "#80565d")
    (cons 340 "#6272a4")
    (cons 360 "#6272a4")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)
