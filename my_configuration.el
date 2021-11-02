(setq use-package-always-ensure t)

(use-package doom-themes
  :init
  (load-theme 'doom-nord t))

(use-package all-the-icons)
; make icons look nice.
(all-the-icons-wicon "tornado" :face 'all-the-icons-blue)

;(use-package doom-modeline
;  :init (doom-modeline-mode 1))

;(global-display-line-numbers-mode t)
;; Disable line numbers for some modes
;(dolist (mode '(;;org-mode-hook
;                org-agenda-mode-hook
;                term-mode-hook
;                shell-mode-hook
;                eshell-mode-hook
;                vterm-mode-hook
;                treemacs-mode-hook
;                compilation-mode-hook))
;  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(set-frame-parameter (selected-frame) 'alpha `(90,90))
(add-to-list 'default-frame-alist `(alpha . (90, 90)))
(set-frame-parameter (selected-frame) 'fullscreen 'maximized)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(when window-system (add-hook 'prog-mode-hook 'hl-line-mode))

(when window-system
      (use-package pretty-mode
      :ensure t
      :config
      (global-pretty-mode t)))

(use-package async
  :ensure t
  :init (dired-async-mode 1))

(setq inhibit-startup-message t) ;; Hide welcome buffer
(scroll-bar-mode -1)             ;; Disable visible scrollbar
(tool-bar-mode -1)               ;; Disable the toolbar
(tooltip-mode -1)                ;; Disable tooltips (pop-up help text for buttons and menu-items). When disabled shows tooltips in echo area
(set-fringe-mode 10)             ;; Set right and left edge fringes (empty borders) in px
(menu-bar-mode -1)               ;; Disable menu bar

(setq visible-bell t)            ;; Set up visible bell

;; Stop asking each time to execute code from babel blocks
(setq org-confirm-babel-evaluate nil)
(global-set-key "\C-ca" 'org-agenda)

(global-visual-line-mode)

(use-package vterm)
;;(use-package vterm
;;  :commands (vterm)
;;  :ensure t
;;  :init
;;  (unless (file-exists-p (concat (file-name-directory (locate-library "vterm"))
;;                                 "vterm-module.so"))
;;    (message "Set vterm to install.")
;;    (setq vterm-install t)))

(use-package counsel
  :config
  (counsel-mode 1))

(use-package ivy
  ;;  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

;; Show function descriptions and keybindings in counsel M-x and other buffers
(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

(use-package smex)

;; Enhance describe
(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

(use-package which-key
  :config
  (setq which-key-idle-delay 0.4)
  (which-key-mode +1))

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  ;(setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)
  
  (defun dw/dont-arrow-me-bro ()
  (interactive)
  (message "Arrow keys are bad, you know?"))

    ;; Disable arrow keys in normal and visual modes
   (define-key evil-normal-state-map (kbd "<left>") 'dw/dont-arrow-me-bro)
    (define-key evil-normal-state-map (kbd "<right>") 'dw/dont-arrow-me-bro)
    (define-key evil-normal-state-map (kbd "<down>") 'dw/dont-arrow-me-bro)
    (define-key evil-normal-state-map (kbd "<up>") 'dw/dont-arrow-me-bro)
    (evil-global-set-key 'motion (kbd "<left>") 'dw/dont-arrow-me-bro)
    (evil-global-set-key 'motion (kbd "<right>") 'dw/dont-arrow-me-bro)
    (evil-global-set-key 'motion (kbd "<down>") 'dw/dont-arrow-me-bro)
    (evil-global-set-key 'motion (kbd "<up>") 'dw/dont-arrow-me-bro)
    (evil-global-set-key 'motion (kbd "<backspace>") 'abj/dont-use-backspace)
 
  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(defun efs/org-font-setup ()
;; Replace list hyphen with dot
(font-lock-add-keywords 'org-mode
'(("^ *\\([-]\\) "
(0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

;; Set faces for heading levels
(dolist (face '((org-level-1 . 1.2)
(org-level-2 . 1.1)
(org-level-3 . 1.05)
(org-level-4 . 1.0)
(org-level-5 . 1.1)
(org-level-6 . 1.1)
(org-level-7 . 1.1)
(org-level-8 . 1.1)))
(set-face-attribute (car face) nil :font "Cantarell" :weight 'regular :height (cdr face)))

;; Ensure that anything that should be fixed-pitch in Org files appears that way
(set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
(set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-table nil   :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
(set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
(set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(defun efs/org-mode-visual-fill ()
  (setq visual-fill-column-width 100
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook (org-mode . efs/org-mode-visual-fill))

(use-package hungry-delete)

(use-package projectile)
(use-package flycheck)
(use-package yasnippet :config (yas-global-mode))
(use-package lsp-mode :hook ((lsp-mode . lsp-enable-which-key-integration))
  :config (setq lsp-completion-enable-additional-text-edit nil))
(use-package hydra)
(use-package company)
(use-package lsp-ui)
(use-package which-key :config (which-key-mode))
(use-package lsp-java :config (add-hook 'java-mode-hook 'lsp))
(use-package dap-mode :after lsp-mode :config (dap-auto-configure-mode))
(use-package dap-java :ensure nil)
(use-package lsp-ivy)
(use-package lsp-treemacs)

;(progn 
;    (find-file "~/Desktop/Everything/Emacs/Daily-Routine.org" )
;    (split-window-horizontally)
;    (dashboard-refresh-buffer)
;)
;; Adding this function to exwm
(defun abj/startup-window()
  "Open dashboard and Daily-Routine.org in startup window."
  (interactive)
  (exwm-workspace-switch-create 1)
  (find-file "~/Desktop/Everything/Emacs/Daily-Routine.org" )
  (split-window-horizontally)
  ;(dashboard-setup-startup-hook)
  ;(dashboard-refresh-buffer)
  (find-file "~/Desktop/Everything/Emacs/Steps.org" )
)

(defun abj/bind-vterm-to-workspace(workspace-index buffer-name dir)
   "Bind a buffer to a workspace in EXWM"
   (interactive)
   (exwm-workspace-switch-create workspace-index)
   (multi-vterm)
   (let ((default-buffer-name "*vterminal<1>*"))
   (progn
   (comint-send-string (get-buffer-process default-buffer-name) (format "cd %s\n" dir))
   (with-current-buffer default-buffer-name
     (rename-buffer buffer-name))
     ))
     )
 (defun abj/firefox-buffer()
 "Opens firefox in workspace 4 at startup"
   (interactive)
   (exwm-workspace-switch-create 4)
   (start-process-shell-command "firefox" "global-firefox" "firefox")
)
(defun abj/dashboard-buffer()
 "Opens dashboard in workspace 3 at startup"
 (interactive)
 (exwm-workspace-switch-create 3)
 (dashboard-setup-startup-hook)
 (dashboard-refresh-buffer)
 )

 (defun abj/init-workspace-bounded-buffers()
   "Initializes buffers in workspaces"
   (interactive)
   ;(setq exwm-workspace-number 7l)
   (abj/dashboard-buffer)
   (abj/bind-vterm-to-workspace 2 "project-vterm" "~/Desktop/Everything/")
   (abj/bind-vterm-to-workspace 5 "others-vterm" "~/gdrive-mount-point/")
   (abj/firefox-buffer)
   (abj/startup-window)
   (exwm-workspace-switch 1)
 )
 ;(bind-buffer-to-workspace)

(defun efs/set-wallpaper ()
    (interactive)
    ;; NOTE: You will need to update this to a valid background path!
    (start-process-shell-command
        "feh" nil  "feh --bg-scale /usr/share/backgrounds/derrick-cooper-L505cPnmIds-unsplash.jpg"))
  (defun efs/configure-window-by-class ()
    (interactive)
    (pcase exwm-class-name
      ;("Firefox" (exwm-workspace-move-window 2))
      ("Sol" (exwm-workspace-move-window 3))
      ("mpv" (exwm-floating-toggle-floating)
             (exwm-layout-toggle-mode-line))))
  (defun efs/exwm-update-class ()
    (exwm-workspace-rename-buffer exwm-class-name))

  (defun efs/exwm-update-title ()
    (pcase exwm-class-name
      ("Firefox" (exwm-workspace-rename-buffer (format "Firefox: %s" exwm-title)))))


  (use-package exwm
    :ensure t
    :config
      ;; necessary to configure exwm manually
      (require 'exwm-config)

      ;; fringe size, most people prefer 1 
      (fringe-mode 3)
      
      ;; emacs as a daemon, use "emacsclient <filename>" to seamlessly edit files from the terminal directly in the exwm instance
      (server-start)
      ;; Transparency
      (set-frame-parameter (selected-frame) 'alpha `(90,90))
      (add-to-list 'default-frame-alist `(alpha . (90, 90)))
      (set-frame-parameter (selected-frame) 'fullscreen 'maximized)
      (add-to-list 'default-frame-alist '(fullscreen . maximized))

      ;; this fixes issues with ido mode, if you use helm, get rid of it
      ;(exwm-config-ido)
      (efs/set-wallpaper)
      
;; a number between 1 and 9, exwm creates workspaces dynamically so I like starting out with 1
      ;(setq exwm-workspace-number 6)

      ;; When window "class" updates, use it to set the buffer name
      (add-hook 'exwm-update-class-hook #'efs/exwm-update-class)
            
      ;; When window title updates, use it to set the buffer name
      (add-hook 'exwm-update-title-hook #'efs/exwm-update-title)

      ;; Configure windows as they're created
      (add-hook 'exwm-manage-finish-hook #'efs/configure-window-by-class)

      ;; Trying to make workspaces load faster.
      ;(exwm-workspace-switch-create 0)
      ;; this is a way to declare truly global/always working keybindings
      ;; this is a nifty way to go back from char mode to line mode without using the mouse
      
      (exwm-input-set-key (kbd "s-r") #'exwm-reset)
      (exwm-input-set-key (kbd "s-k") #'exwm-workspace-delete)
      (exwm-input-set-key (kbd "s-w") #'exwm-workspace-swap)

      ;; the next loop will bind s-<number> to switch to the corresponding workspace
      (dotimes (i 10)
        (exwm-input-set-key (kbd (format "s-%d" i))
                            `(lambda ()
                               (interactive)
                               (exwm-workspace-switch-create ,i))))

      ;; the simplest launcher, I keep it in only if dmenu eventually stopped working or something
      (exwm-input-set-key (kbd "s-&")
                          (lambda (command)
                            (interactive (list (read-shell-command "$ ")))
                            (start-process-shell-command command nil command)))

      ;; an easy way to make keybindings work *only* in line mode
      (push ?\C-q exwm-input-prefix-keys)
      (define-key exwm-mode-map [?\C-q] #'exwm-input-send-next-key)
      

      
      	
      ;; simulation keys are keys that exwm will send to the exwm buffer upon inputting a key combination
      (exwm-input-set-simulation-keys
       '(
         ;; movement
         ;([?\C-b] . left)
         ;([?\M-b] . C-left)
         ;([?\C-f] . right)
         ;([?\M-f] . C-right)
         ;([?\C-p] . up)
         ;([?\C-n] . down)
         ;([?\C-a] . home)
         ;([?\C-e] . end)
         ;([?\M-v] . prior)
         ;([?\C-v] . next)
         ;([?\C-d] . delete)
         ;([?\C-k] . (S-end delete))
         ;; cut/paste
         ;([?\C-w] . ?\C-x)
         ([?\M-w] . ?\C-c)
         ;([?\C-y] . ?\C-v)
         ;; search
         ([?\C-s] . ?\C-f)))

     ;; These keys should always pass through to Emacs

      ;; this little bit will make sure that XF86 keys work in exwm buffers as well
      (dolist (k '(XF86AudioLowerVolume
                 XF86AudioRaiseVolume
                 XF86PowerOff
                 XF86AudioMute
                 XF86AudioPlay
                 XF86AudioStop
                 XF86AudioPrev
                 XF86AudioNext
                 XF86ScreenSaver
                 XF68Back
                 XF86Forward
                 Scroll_Lock
                 print))
      (cl-pushnew k exwm-input-prefix-keys))
      
      
      ;(setq exwm-input-global-keys
      ;`(;; Various other keys...
      
      ;; Prompt for a selection and take a screenshot

(setq exwm-input-global-keys
      `(;; Various other keys...

        ;; Prompt for a selection and take a screenshot
        (,(kbd "s-$") . md/screenshot-image-selection)
        ;; Prompt for a selectoin and start a video
        (,(kbd "s-%") . md/screenshot-video-selection-start)
        ;; Stop the video
        (,(kbd "s-^") . md/screenshot-video-stop)))

      (exwm-enable)
      (abj/init-workspace-bounded-buffers)
      ;; this just enables exwm, it started automatically once everything is ready
      ;(define-prefix-command 'ss-map nil "ss, record-")
      ;:bind-keymap ((kbd "s-r") . ss-map)
      ;:bind ( :map ss-map
       ; ("s" . md/screenshot-image-selection)
       ; ("v" . md/screenshot-video-selection-start)
       ; ("e" . md/screenshot-video-stop)
;	)
)

(use-package dmenu
  :ensure t
  :bind
    ("s-SPC" . 'dmenu))

(defun exwm-async-run (name)
  (interactive)
  (start-process name nil name))

(defun daedreth/launch-discord ()
  (interactive)
  (exwm-async-run "discord"))

(defun daedreth/launch-browser ()
  (interactive)
  (exwm-async-run "qutebrowser"))

(defun daedreth/lock-screen ()
  (interactive)
  (exwm-async-run "slock"))

(defun daedreth/shutdown ()
  (interactive)
  (start-process "halt" nil "sudo" "halt"))

(global-set-key (kbd "s-d") 'daedreth/launch-discord)
(global-set-key (kbd "<s-tab>") 'daedreth/launch-browser)
(global-set-key (kbd "s-l") 'daedreth/lock-screen)
(global-set-key (kbd "<XF86PowerOff>") 'daedreth/shutdown)

(defconst volumeModifier "4")

(defun audio/mute ()
  (interactive)
  (start-process "audio-mute" nil "pulsemixer" "--toggle-mute"))

(defun audio/raise-volume ()
  (interactive)
  (start-process "raise-volume" nil "pulsemixer" "--change-volume" (concat "+" volumeModifier)))

(defun audio/lower-volume ()
  (interactive)
  (start-process "lower-volume" nil "pulsemixer" "--change-volume" (concat "-" volumeModifier)))

(global-set-key (kbd "<XF86AudioMute>") 'audio/mute)
(global-set-key (kbd "<XF86AudioRaiseVolume>") 'audio/raise-volume)
(global-set-key (kbd "<XF86AudioLowerVolume>") 'audio/lower-volume)

(defun daedreth/take-screenshot ()
  "Takes a fullscreen screenshot of the current workspace"
  (interactive)
  (when window-system
  (loop for i downfrom 3 to 1 do
        (progn
          (message (concat (number-to-string i) "..."))
          (sit-for 1)))
  (message "Cheese!")
  (sit-for 1)
  (start-process "screenshot" nil "import" "-window" "root" 
             (concat (getenv "HOME") "/" (subseq (number-to-string (float-time)) 0 10) ".png"))
  (message "Screenshot taken!")))
(global-set-key (kbd "<print>") 'daedreth/take-screenshot)

(defun daedreth/take-screenshot-region ()
  "Takes a screenshot of a region selected by the user."
  (interactive)
  (when window-system
  (call-process "import" nil nil nil ".newScreen.png")
  (call-process "convert" nil nil nil ".newScreen.png" "-shave" "1x1"
                (concat (getenv "HOME") "/" (subseq (number-to-string (float-time)) 0 10) ".png"))
  (call-process "rm" nil nil nil ".newScreen.png")))
(global-set-key (kbd "<Scroll_Lock>") 'daedreth/take-screenshot-region)

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "firefox")

(use-package dashboard
  :ensure t
  :config
    (dashboard-setup-startup-hook)
    ;;(setq dashboard-startup-banner "~/.emacs.d/img/dashLogo.png")
    (setq dashboard-items '((recents  . 5)
                            (projects . 5)))
    (setq dashboard-banner-logo-title "")
    )

(use-package spaceline
  :ensure t
  :config
  (require 'spaceline-config)
    (setq spaceline-buffer-encoding-abbrev-p nil)
    (setq spaceline-line-column-p nil)
    (setq spaceline-line-p nil)
    (setq powerline-default-separator (quote arrow))
    (spaceline-spacemacs-theme))

(setq powerline-default-separator nil)

(setq line-number-mode t)
(setq column-number-mode t)

(setq display-time-24hr-format nil)
(setq display-time-format "%H:%M - %d %B %Y")

(display-time-mode 1)

(use-package fancy-battery
  :ensure t
  :config
    (setq fancy-battery-show-percentage t)
    (setq battery-update-interval 15)
    (if window-system
      (fancy-battery-mode)
      (display-battery-mode)))

(use-package symon
  :ensure t
  :bind
  ("s-h" . symon-mode))

(defvar my-term-shell "/bin/bash")
(defadvice ansi-term (before force-bash)
  (interactive (list my-term-shell)))
(ad-activate 'ansi-term)

(global-set-key (kbd "<s-return>") 'ansi-term)

(use-package ivy
  :ensure t)

(setq scroll-conservatively 100)

(use-package which-key
  :ensure t
  :config
    (which-key-mode))

(use-package switch-window
  :ensure t
  :config
    (setq switch-window-input-style 'minibuffer)
    (setq switch-window-increase 4)
    (setq switch-window-threshold 2)
    (setq switch-window-shortcut-style 'qwerty)
    (setq switch-window-qwerty-shortcuts
        '("a" "s" "d" "f" "j" "k" "l" "i" "o"))
  :bind
    ([remap other-window] . switch-window))

(defun split-and-follow-horizontally ()
  (interactive)
  (split-window-below)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 2") 'split-and-follow-horizontally)

(defun split-and-follow-vertically ()
  (interactive)
  (split-window-right)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 3") 'split-and-follow-vertically)

(use-package swiper
  :ensure t
  :bind ("C-s" . 'swiper))

(defun kill-current-buffer ()
  "Kills the current buffer."
  (interactive)
  (kill-buffer (current-buffer)))
(global-set-key (kbd "C-x k") 'kill-current-buffer)

;(setq kill-buffer-query-functions (delq 'process-kill-buffer-query-function kill-buffer-query-functions))

;(global-set-key (kbd "C-x b") 'ibuffer)

(setq ibuffer-expert t)

(defun close-all-buffers ()
  "Kill all buffers without regard for their origin."
  (interactive)
  (mapc 'kill-buffer (buffer-list)))
(global-set-key (kbd "C-M-s-k") 'close-all-buffers)

(use-package linum-relative
  :ensure t
  :config
    (setq linum-relative-current-symbol "")
    (add-hook 'prog-mode-hook 'linum-relative-mode))

(defun config-visit ()
  (interactive)
  (find-file "~/.emacs.d/config.org"))
(global-set-key (kbd "C-c e") 'config-visit)

(defun config-reload ()
  "Reloads ~/.emacs.d/config.org at runtime"
  (interactive)
  (org-babel-load-file (expand-file-name "~/.emacs.d/my_configuration.org")))
(global-set-key (kbd "C-c s-r") 'config-reload)

(global-subword-mode 1)

(setq electric-pair-pairs '(
                           (?\{ . ?\})
                           (?\( . ?\))
                           (?\[ . ?\])
                           (?\" . ?\")
                           ))

(electric-pair-mode t)

(use-package beacon
  :ensure t
  :config
    (beacon-mode 1))

(use-package rainbow-mode
  :ensure t
  :init
    (add-hook 'prog-mode-hook 'rainbow-mode))

(show-paren-mode 1)

(use-package rainbow-delimiters
  :ensure t
  :init
    (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package expand-region
  :ensure t
  :bind ("C-q" . er/expand-region))

(setq kill-ring-max 100)

(use-package popup-kill-ring
  :ensure t
  :bind ("M-y" . popup-kill-ring))

(use-package yasnippet
  :ensure t
  :config
    (use-package yasnippet-snippets
      :ensure t)
    (yas-reload-all))

(use-package flycheck
  :ensure t)

(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 3))

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous)
  (define-key company-active-map (kbd "SPC") #'company-abort))

(add-hook 'c++-mode-hook 'yas-minor-mode)
(add-hook 'c-mode-hook 'yas-minor-mode)

(use-package flycheck-clang-analyzer
  :ensure t
  :config
  (with-eval-after-load 'flycheck
    (require 'flycheck-clang-analyzer)
     (flycheck-clang-analyzer-setup)))

(with-eval-after-load 'company
  (add-hook 'c++-mode-hook 'company-mode)
  (add-hook 'c-mode-hook 'company-mode))

(use-package company-c-headers
  :ensure t)

(use-package company-irony
  :ensure t
  :config
  (setq company-backends '((company-c-headers
                            company-dabbrev-code
                            company-irony))))

(use-package irony
  :ensure t
  :config
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))

(add-hook 'python-mode-hook 'yas-minor-mode)
(add-hook 'python-mode-hook 'flycheck-mode)

(with-eval-after-load 'company
    (add-hook 'python-mode-hook 'company-mode))

(use-package company-jedi
  :ensure t
  :config
    (require 'company)
    (add-to-list 'company-backends 'company-jedi))

(defun python-mode-company-init ()
  (setq-local company-backends '((company-jedi
                                  company-etags
                                  company-dabbrev-code))))

(use-package company-jedi
  :ensure t
  :config
    (require 'company)
    (add-hook 'python-mode-hook 'python-mode-company-init))

(add-hook 'emacs-lisp-mode-hook 'eldoc-mode)
(add-hook 'emacs-lisp-mode-hook 'yas-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'company-mode)

(use-package slime
  :ensure t
  :config
  (setq inferior-lisp-program "/usr/bin/sbcl")
  (setq slime-contribs '(slime-fancy)))

(use-package slime-company
  :ensure t
  :init
    (require 'company)
    (slime-setup '(slime-fancy slime-company)))

(add-hook 'shell-mode-hook 'yas-minor-mode)
(add-hook 'shell-mode-hook 'flycheck-mode)
(add-hook 'shell-mode-hook 'company-mode)

(defun shell-mode-company-init ()
  (setq-local company-backends '((company-shell
                                  company-shell-env
                                  company-etags
                                  company-dabbrev-code))))

(use-package company-shell
  :ensure t
  :config
    (require 'company)
    (add-hook 'shell-mode-hook 'shell-mode-company-init))

(use-package sudo-edit
  :ensure t
  :bind
    ("s-e" . sudo-edit))

(use-package diminish
  :ensure t
  :init
  (diminish 'which-key-mode)
  (diminish 'linum-relative-mode)
  (diminish 'hungry-delete-mode)
  (diminish 'visual-line-mode)
  (diminish 'subword-mode)
  (diminish 'beacon-mode)
  (diminish 'irony-mode)
  (diminish 'page-break-lines-mode)
  (diminish 'auto-revert-mode)
  (diminish 'rainbow-delimiters-mode)
  (diminish 'rainbow-mode)
  (diminish 'yas-minor-mode)
  (diminish 'flycheck-mode)
  (diminish 'helm-mode))

(setq erc-nick "daedreth")
(setq erc-prompt (lambda () (concat "[" (buffer-name) "]")))
(setq erc-hide-list '("JOIN" "PART" "QUIT"))

(setq erc-server-history-list '("irc.freenode.net"
                                "localhost"))

(use-package erc-hl-nicks
  :ensure t
  :config
    (erc-update-modules))

(use-package elcord
  :ensure t)

;; This is an example `use-package' configuration
;; It is not tangled into wallpaper.el
;(use-package wallpaper
 ; :ensure t
 ; :hook ((exwm-randr-screen-change . wallpaper-set-wallpaper)
 ;        (after-init . wallpaper-cycle-mode))
 ; :custom ((wallpaper-cycle-single t)
 ;          (wallpaper-scaling 'scale)
 ;          (wallpaper-cycle-interval 4500)
 ;          (wallpaper-cycle-directory "/usr/share/backgrounds")))

;(unless (executable-find "feh")
;  (display-warning 'wallpaper "External command `feh' not found!"))

;(require 'cl-lib)

(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode))

(require 'pulseaudio-control)
(pulseaudio-control-default-keybindings)

(use-package multi-vterm)

;(setq mode-line-format (format "Workspace: %d " exwm-workspace-current-index))
;(message "Current workspace: %d" mode-line-format)
;(message "The value of fill-column is %d." fill-column)
;(force-mode-line-update t)

(defun abj/show-current-workspace()
  (message (format "Current Workspace: %d" exwm-workspace-current-index))
  (setq global-mode-string (last global-mode-string 1))
  (add-to-list 'global-mode-string (format "Workspace: %d " exwm-workspace-current-index))
  (force-mode-line-update t)
)
(add-hook 'exwm-workspace-switch-hook #'abj/show-current-workspace)

;(quelpa
; '(quelpa-use-package
;   :fetcher git
;   :url "https://github.com/quelpa/quelpa-use-package.git"))
;(require 'quelpa-use-package)

;(use-package bufler
 ;  :quelpa (bufler :fetcher github :repo "alphapapa/bufler.el"
 ;                  :files (:defaults (:exclude "helm-bufler.el"))))
; (use-package bufler)

;(exwm-workspace--display-buffer "*scratch*" display-buffer-alist)
;(buffer-list)
;(frame-face-alist)

(when (fboundp 'eww)
  (defun xah-rename-eww-buffer ()
    "Rename `eww-mode' buffer so sites open in new page.
URL `http://ergoemacs.org/emacs/emacs_eww_web_browser.html'
Version 2017-11-10"
    (let (($title (plist-get eww-data :title)))
      (when (eq major-mode 'eww-mode )
        (if $title
            (rename-buffer (concat "eww " $title ) t)
          (rename-buffer "eww" t)))))

  (add-hook 'eww-after-render-hook 'xah-rename-eww-buffer))

;; Don't run/evaluate or export this code block.
(exwm-input-set-simulation-keys
 '(([?\C-b] . left)
  ([?\C-f] . right)))

(exwm-input-set-key (kbd "s-i") 'exwm-input-toggle-keyboard)

(add-hook 'exwm-manage-finish-hook
  (lambda () (call-interactively #'exwm-input-release-keyboard)
     ;(exwm-layout-hide-mode-line)
))

;(desktop-save-mode 1)

(use-package projectile)
(projectile-mode +1)
;; Recommended keymap prefix on Windows/Linux
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

(defun text-mode-hook-setup ()
  ;; make `company-backends' local is critcal
  ;; or else, you will have completion in every major mode, that's very annoying!
  (make-local-variable 'company-backends)

  ;; company-ispell is the plugin to complete words
  (add-to-list 'company-backends 'company-ispell)

  ;; OPTIONAL, if `company-ispell-dictionary' is nil, `ispell-complete-word-dict' is used
  ;;  but I prefer hard code the dictionary path. That's more portable.
  (setq company-ispell-dictionary (file-truename "~/.emacs.d/misc/english-words.txt")))

(add-hook 'text-mode-hook 'text-mode-hook-setup)

(defun company-abort-and-insert-space ()
  (interactive)
  (company-abort)
  (insert " "))

(define-key company-active-map (kbd "SPC") #'company-abort-and-insert-space)

(exwm-input-set-key (kbd "s-a") 'counsel-linux-app)

(defun md/screenshot-image-selection ()
  (interactive)
  (shell-command "/home/abhijit/manual-installation/,screenshot.sh --image-selection"))

(defun md/screenshot-video-selection-start ()
  (interactive)
  (shell-command "/home/abhijit/manual-installation/,screenshot.sh --video-selection-start"))

(defun md/screenshot-video-stop ()
  (interactive)
  (shell-command "/home/abhijit/manual-installation/,screenshot.sh --video-stop"))

;(require 'letterbox-mode)

(use-package outline
  :config 
    (define-prefix-command 'cm-map nil "Outline-") 
  :bind-keymap ("C-o" . cm-map)
  :bind (:map cm-map 
    ("q" . outline-hide-sublevels) 
    ("t" . outline-hide-body) 
    ("o" . outline-hide-other)
  ) 
)



(defun create-scratch-buffer nil
   "create a scratch buffer"
   (interactive)
   (switch-to-buffer (get-buffer-create "*scratch*"))
   (lisp-interaction-mode))

(setq org-clock-sound "~/.emacs.d/misc/ding.wav")

(defun abj/dont-use-backspace()
(interactive)
(message "Backspace is bad!"))

(add-to-list 'load-path "~/.emacs.d/")
(load "auto-save.el")
(setq auto-save-directory (expand-file-name "~/manual-installation/autosave/"))

(require 'multi-web-mode)
(setq mweb-default-major-mode 'html-mode)
(setq mweb-tags 
  '((js-mode  "<script[^>]*>" "</script>")
    (css-mode "<style[^>]*>" "</style>")))
(setq mweb-filename-extensions '("htm" "html" "phtml"))
(multi-web-global-mode 1)

(require 'lorem-ipsum)
(lorem-ipsum-use-default-bindings)

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
;;(global-set-key "\C-x\ \C-r" 'recentf-open-files)
(global-set-key (kbd "C-c r l") 'recentf-open-files)

(defun abj/split-and-open()
  (interactive)
  (split-window-horizontally)
  (recentf-open-files)
)


(global-set-key (kbd "C-c r s") 'abj/split-and-open)

(setq org-image-actual-width nil)

(use-package ox-reveal
  :ensure t)
(use-package htmlize)

(use-package ein
  :init 
  (setq ein:polymode t
        ein:output-area-inlined-images t)
  )

(use-package marginalia
  ;; Either bind `marginalia-cycle` globally or only in the minibuffer
  :bind (("M-A" . marginalia-cycle)
         :map minibuffer-local-map
         ("M-A" . marginalia-cycle))

  ;; The :init configuration is always executed (Not lazy!)
  :init

  ;; Must be in the :init section of use-package such that the mode gets
  ;; enabled right away. Note that this forces loading the package.
  (marginalia-mode))

(add-to-list 'load-path "~/.emacs.d/")
(load "ob-shell.el")

(defun abj/open-VM()
   "Open dashboard and Daily-Routine.org in startup window."
   (interactive)
   (exwm-workspace-switch-create 6)
   (find-file "~/Desktop/Everything/Virtual-Machine-Info/centos-cli.org" )
   (split-window-horizontally)
   (multi-vterm)
   (multi-vterm-rename-buffer "Remote Virtual Machine")
 )
 
(global-set-key (kbd "C-c v m") 'abj/open-VM)
