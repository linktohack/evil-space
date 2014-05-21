(setq evil-space-next-key (kbd "SPC"))
(setq evil-space-next-key (kbd "SPC"))
(defadvice evil-next-line (before evil-space-next-line activate)
  (define-key evil-normal-state-map (kbd "SPC") 'evil-next-line)
  (define-key evil-normal-state-map (kbd "DEL") 'evil-previous-line))

(defadvice evil-previous-line (before evil-space-previous-line activate)
  (define-key evil-normal-state-map (kbd "SPC") 'evil-next-line)
  (define-key evil-normal-state-map (kbd "DEL") 'evil-previous-line))

;; (defadvice evil-next-line (before evil-space-next-line activate)
;;   (defalias 'evil-space-next 'evil-next-line)
;;   (defalias 'evil-space-prev 'evil-previous-line))

;; (defadvice evil-previous-line (before evil-space-previous-line activate)
;;   (defalias 'evil-space-next 'evil-previous-line)
;;   (defalias 'evil-space-prev 'evil-next-line))
