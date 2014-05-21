(setq evil-space-next-key (kbd "SPC"))
(setq evil-space-previous-key (kbd "S-SPC"))

(setq evil-space-last-count 1)

(evil-define-motion evil-space-next-line (count)
  "Setup evil-space and Move the cursor COUNT lines down."
  :type line
  (setq evil-space-last-count (or count 1))
  (define-key evil-motion-state-map evil-space-next-key
    '(lambda () (interactive) (evil-next-line evil-space-last-count)))
  (define-key evil-motion-state-map evil-space-previous-key
    '(lambda () (interactive) (evil-previous-line evil-space-last-count)))
  (evil-next-line evil-space-last-count))

(evil-define-motion evil-space-previous-line (count)
  "Setup evil-space and Move the cursor COUNT lines up."
  :type line
  (setq evil-space-last-count (or count 1))
  (define-key evil-motion-state-map evil-space-next-key
    '(lambda () (interactive) (evil-previous-line evil-space-last-count)))
  (define-key evil-motion-state-map evil-space-previous-key
    '(lambda () (interactive) (evil-next-line evil-space-last-count)))
  (evil-previous-line evil-space-last-count))

(evil-define-motion evil-space-search-next (count)
  "Setup evil-space and Repeat the last search."
  :jump t
  :type exclusive
  (setq evil-space-last-count (or count 1))
  (define-key evil-motion-state-map evil-space-next-key
    '(lambda () (interactive) (evil-search-next evil-space-last-count)))
  (define-key evil-motion-state-map evil-space-previous-key
    '(lambda () (interactive) (evil-search-previous evil-space-last-count)))
  (evil-search-next evil-space-last-count))

(evil-define-motion evil-space-search-previous (count)
  "Setup evil-space and Repeat the last search in the opposite direction."
  :jump t
  :type exclusive
  (setq evil-space-last-count (or count 1))
  (define-key evil-motion-state-map evil-space-next-key
    '(lambda () (interactive) (evil-search-previous evil-space-last-count)))
  (define-key evil-motion-state-map evil-space-previous-key
    '(lambda () (interactive) (evil-search-next evil-space-last-count)))
  (evil-search-previous evil-space-last-count))

(define-key evil-motion-state-map "j" 'evil-space-next-line)
(define-key evil-motion-state-map "k" 'evil-space-previous-line)
(define-key evil-motion-state-map "n" 'evil-space-search-next)
(define-key evil-motion-state-map "N" 'evil-space-search-previous)
