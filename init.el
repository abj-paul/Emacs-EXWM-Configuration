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
