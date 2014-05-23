(require 'evil)

(setq evil-space-next-key (kbd "SPC"))
(setq evil-space-previous-key (kbd "S-SPC"))

(setq evil-space-last-count 1)

(evil-define-motion evil-space-forward-word-begin (count &optional bigword)
  "Setup evil-space and Move the cursor to the beginning of the COUNT-th next word.
If BIGWORD is non-nil, move by WORDS."
  :type exclusive
  (setq evil-space-last-count (or count 1))
  (define-key evil-motion-state-map evil-space-next-key
    '(lambda () (interactive) (evil-forward-word-begin evil-space-last-count)))
  (define-key evil-motion-state-map evil-space-previous-key
    '(lambda () (interactive) (evil-backward-word-begin evil-space-last-count)))
  (evil-forward-word-begin evil-space-last-count))

(evil-define-motion evil-space-backward-word-begin (count &optional bigword)
  "Setup evil-space and Move the cursor to the beginning of the COUNT-th previous word.
If BIGWORD is non-nil, move by WORDS."
  :type inclusive
  (setq evil-space-last-count (or count 1))
  (define-key evil-motion-state-map evil-space-next-key
    '(lambda () (interactive) (evil-backward-word-begin evil-space-last-count)))
  (define-key evil-motion-state-map evil-space-previous-key
    '(lambda () (interactive) (evil-forward-word-begin evil-space-last-count)))
  (evil-backward-word-begin evil-space-last-count))

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

(evil-define-motion evil-space-find-char (count char)
  "Setup evil-space and Move to the next COUNT'th occurrence of CHAR."
  :jump t
  :type exclusive
  (interactive "<c><C>")
  (setq evil-space-last-count (or count 1))
  (define-key evil-motion-state-map evil-space-next-key
    '(lambda () (interactive) (evil-repeat-find-char evil-space-last-count)))
  (define-key evil-motion-state-map evil-space-previous-key
    '(lambda () (interactive) (evil-repeat-find-char-reverse evil-space-last-count)))
  (evil-find-char evil-space-last-count char))

(evil-define-motion evil-space-find-char-backward (count char)
  "Setup evil-space and Move before the next COUNT'th occurrence of CHAR."
  :jump t
  :type exclusive
  (interactive "<c><C>")
  (setq evil-space-last-count (or count 1))
  (define-key evil-motion-state-map evil-space-next-key
    '(lambda () (interactive) (evil-repeat-find-char evil-space-last-count)))
  (define-key evil-motion-state-map evil-space-previous-key
    '(lambda () (interactive) (evil-repeat-find-char-reverse evil-space-last-count)))
  (evil-find-char-backward evil-space-last-count char))

(evil-define-motion evil-space-find-char-to (count char)
  "Setup evil-space and Move before the next COUNT'th occurrence of CHAR."
  :jump t
  :type inclusive
  (interactive "<c><C>")
  (setq evil-space-last-count (or count 1))
  (define-key evil-motion-state-map evil-space-next-key
    '(lambda () (interactive) (evil-repeat-find-char evil-space-last-count)))
  (define-key evil-motion-state-map evil-space-previous-key
    '(lambda () (interactive) (evil-repeat-find-char-reverse evil-space-last-count)))
  (evil-find-char-to evil-space-last-count char))

(evil-define-motion evil-space-find-char-to-backward (count char)
  "Setup evil-space and Move before the next COUNT'th occurrence of CHAR."
  :jump t
  :type inclusive
  (interactive "<c><C>")
  (setq evil-space-last-count (or count 1))
  (define-key evil-motion-state-map evil-space-next-key
    '(lambda () (interactive) (evil-repeat-find-char evil-space-last-count)))
  (define-key evil-motion-state-map evil-space-previous-key
    '(lambda () (interactive) (evil-repeat-find-char-reverse evil-space-last-count)))
  (evil-find-char-to-backward evil-space-last-count char))

(evil-define-motion evil-space-forward-paragraph (count)
  "Setup evil-space and Move to the end of the COUNT-th next paragraph."
  :jump t
  :type exclusive
  (setq evil-space-last-count (or count 1))
  (define-key evil-motion-state-map evil-space-next-key
    '(lambda () (interactive) (evil-forward-paragraph evil-space-last-count)))
  (define-key evil-motion-state-map evil-space-previous-key
    '(lambda () (interactive) (evil-backward-paragraph evil-space-last-count)))
  (evil-forward-paragraph evil-space-last-count))

(evil-define-motion evil-space-backward-paragraph (count)
  "Move to the beginning of the COUNT-th previous paragraph."
  :jump t
  :type exclusive
  (setq evil-space-last-count (or count 1))
  (define-key evil-motion-state-map evil-space-next-key
    '(lambda () (interactive) (evil-backward-paragraph evil-space-last-count)))
  (define-key evil-motion-state-map evil-space-previous-key
    '(lambda () (interactive) (evil-forward-paragraph evil-space-last-count)))
  (evil-backward-paragraph evil-space-last-count))

(evil-define-motion evil-space-forward-section-begin (count)
  "Move the cursor to the beginning of the COUNT-th next section."
  :jump t
  :type exclusive
  (setq evil-space-last-count (or count 1))
  (define-key evil-motion-state-map evil-space-next-key
    '(lambda () (interactive) (evil-forward-section-begin evil-space-last-count)))
  (define-key evil-motion-state-map evil-space-previous-key
    '(lambda () (interactive) (evil-backward-section-begin evil-space-last-count)))
  (evil-forward-section-begin evil-space-last-count))

(evil-define-motion evil-space-backward-section-begin (count)
  "Setup evil-space and Move the cursor to the beginning of the COUNT-th previous section."
  :jump t
  :type exclusive
  (setq evil-space-last-count (or count 1))
  (define-key evil-motion-state-map evil-space-next-key
    '(lambda () (interactive) (evil-backward-section-begin evil-space-last-count)))
  (define-key evil-motion-state-map evil-space-previous-key
    '(lambda () (interactive) (evil-forward-section-begin evil-space-last-count)))
  (evil-backward-section-begin evil-space-last-count))

(evil-define-command evil-space-scroll-page-up (count)
  "Scrolls the window COUNT pages upwards."
  :repeat nil
  :keep-visual t
  (interactive "p")
  (setq evil-space-last-count (or count 1))
  (define-key evil-motion-state-map evil-space-next-key
    '(lambda () (interactive) (evil-scroll-page-up evil-space-last-count)))
  (define-key evil-motion-state-map evil-space-previous-key
    '(lambda () (interactive) (evil-scroll-page-down evil-space-last-count)))
  (evil-scroll-page-up evil-space-last-count))

(evil-define-command evil-space-scroll-page-down (count)
  "Setup evil-space and Scrolls the window COUNT pages upwards."
  :repeat nil
  :keep-visual t
  (interactive "p")
  (setq evil-space-last-count (or count 1))
  (define-key evil-motion-state-map evil-space-next-key
    '(lambda () (interactive) (evil-scroll-page-down evil-space-last-count)))
  (define-key evil-motion-state-map evil-space-previous-key
    '(lambda () (interactive) (evil-scroll-page-up evil-space-last-count)))
  (evil-scroll-page-down evil-space-last-count))

(define-key evil-motion-state-map "w" 'evil-space-forward-word-begin)
(define-key evil-motion-state-map "b" 'evil-space-backward-word-begin)
(define-key evil-motion-state-map "j" 'evil-space-next-line)
(define-key evil-motion-state-map "k" 'evil-space-previous-line)
(define-key evil-motion-state-map "/" 'evil-space-search-forward)
(define-key evil-motion-state-map "?" 'evil-space-search-backward)
(define-key evil-motion-state-map "n" 'evil-space-search-next)
(define-key evil-motion-state-map "N" 'evil-space-search-previous)
(define-key evil-motion-state-map "f" 'evil-space-find-char)
(define-key evil-motion-state-map "F" 'evil-space-find-char-backward)
(define-key evil-motion-state-map "t" 'evil-space-find-char-to)
(define-key evil-motion-state-map "T" 'evil-space-find-char-to-backward)
(define-key evil-motion-state-map "}" 'evil-space-forward-paragraph)
(define-key evil-motion-state-map "{" 'evil-space-backward-paragraph)
(define-key evil-motion-state-map "]]" 'evil-space-forward-section-begin)
(define-key evil-motion-state-map "[[" 'evil-space-backward-section-begin)
(define-key evil-motion-state-map (kbd "C-b") 'evil-space-scroll-page-up)
(define-key evil-motion-state-map (kbd "C-f") 'evil-space-scroll-page-down)

(provide 'evil-space)
