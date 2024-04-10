(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(unless (package-installed-p 'evil)
  (package-refresh-contents)
  (package-install 'evil))

(require 'evil)
(evil-mode 1)

(unless (package-installed-p 'company)
  (package-install 'company))

;; Enable Company mode globally
(add-hook 'after-init-hook 'global-company-mode)

;; Hide the menu bar
(menu-bar-mode -1)

;; Hide the tool bar
(tool-bar-mode -1)

;; Hide the scroll bar
(scroll-bar-mode -1)

;; Hide the tooltip
(tooltip-mode -1)

;; Hide the scrollbar in the fringes
(fringe-mode 0)

(require 'org)
(add-hook 'org-mode-hook
          (lambda ()
            (local-set-key (kbd "<tab>") 'org-cycle)))
(global-visual-line-mode t)

(defun my-org-collapse-all ()
  "Collapse all headings in the current Org buffer."
  (interactive)
  (org-shifttab t))

(add-hook 'org-mode-hook 'my-org-collapse-all)

;; Centering text
(require 'visual-fill-column)
(global-visual-fill-column-mode t)
(setq-default visual-fill-column-center-text t)





(unless (package-installed-p 'exwm)
  (package-install 'exwm))
(require 'exwm)
(require 'exwm-config)
;; simple system tray
(require 'exwm-systemtray)
(exwm-systemtray-enable)

(require 'exwm-config)
(exwm-config-example)

;; using xim input
(require 'exwm-xim)
(exwm-xim-enable)
(push ?\C-\\ exwm-input-prefix-keys)   ;; use Ctrl + \ to switch input method

;; Loading a theme
(load-theme 'timu-rouge t)

;; Installing ivy
(unless (package-installed-p 'ivy)
  (package-install 'ivy))
(ivy-mode 1) ; Enable Ivy globally

;; Installing swiper
(unless (package-installed-p 'swiper)
  (package-install 'swiper))

;; Optionally, you can customize the keybindings.
(global-set-key (kbd "C-s") 'swiper) ; Bind swiper to Ctrl + s
(global-set-key (kbd "C-r") 'swiper) ; Use Ctrl + r for reverse searching

(show-paren-mode t)

;; USE PACKAGE STARTS HERE
(use-package org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/Org-Roam-Files/")
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert))
  :config
  (org-roam-setup))


(desktop-environment-mode)

(use-package flycheck
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))

(add-hook 'c++-mode-hook (lambda () (setq flycheck-gcc-language-standard "c++11")))


(use-package vterm
    :ensure t)

(use-package multi-vterm :ensure t)

(setq display-time-12hr-format nil)
(setq display-time-format "%H:%M - %d %B %Y")
(display-time-mode 1)


;; Counsel, ivy, ivy rich for find-file, swiper and others
(require 'ivy)
(counsel-mode 1)
(ivy-mode)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)

(ivy-rich-mode 1)

;; Retain history
(require 'smex)
(smex-initialize)

; Transparency
(set-frame-parameter (selected-frame) 'alpha `(90,90))
(add-to-list 'default-frame-alist `(alpha . (90, 90)))
(set-frame-parameter (selected-frame) 'fullscreen 'maximized)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

