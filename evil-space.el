(defalias 'evil-space-next 'evil-next-line)
(defalias 'evil-space-prev 'evil-previous-line)
(define-key evil-normal-state-map (kbd "SPC") 'evil-space-next)
(define-key evil-normal-state-map (kbd "DEL") 'evil-space-prev)
