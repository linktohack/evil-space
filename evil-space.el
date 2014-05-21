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

(evil-define-motion evil-space-search-forward ()
  (format "Setup evil-space and Search forward for user-entered text.
Searches for regular expression if `evil-regexp-search' is t.%s"
          (if (and (fboundp 'isearch-forward)
                   (documentation 'isearch-forward))
              (format "\n\nBelow is the documentation string \
for `isearch-forward',\nwhich lists available keys:\n\n%s"
                      (documentation 'isearch-forward)) ""))
  :jump t
  :type exclusive
  :repeat evil-repeat-search
  (setq evil-space-last-count 1)
  (define-key evil-motion-state-map evil-space-next-key
    '(lambda () (interactive) (evil-search-next evil-space-last-count)))
  (define-key evil-motion-state-map evil-space-previous-key
    '(lambda () (interactive) (evil-search-previous evil-space-last-count)))
  (evil-search-forward))

(evil-define-motion evil-space-search-backward ()
  (format "Setup evil-space and Search backward for user-entered text.
Searches for regular expression if `evil-regexp-search' is t.%s"
          (if (and (fboundp 'isearch-forward)
                   (documentation 'isearch-forward))
              (format "\n\nBelow is the documentation string \
for `isearch-forward',\nwhich lists available keys:\n\n%s"
                      (documentation 'isearch-forward)) ""))
  :jump t
  :type exclusive
  :repeat evil-repeat-search
  (setq evil-space-last-count 1)
  (define-key evil-motion-state-map evil-space-next-key
    '(lambda () (interactive) (evil-search-previous evil-space-last-count)))
  (define-key evil-motion-state-map evil-space-previous-key
    '(lambda () (interactive) (evil-search-next evil-space-last-count)))
  (evil-search-backward))

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
(define-key evil-motion-state-map "/" 'evil-space-search-forward)
(define-key evil-motion-state-map "?" 'evil-space-search-backward)
(define-key evil-motion-state-map "n" 'evil-space-search-next)
(define-key evil-motion-state-map "N" 'evil-space-search-previous)
