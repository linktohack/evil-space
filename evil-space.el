(require 'evil)

(setq evil-space-next-key (kbd "SPC"))
(setq evil-space-prev-key (kbd "S-SPC"))

(defmacro evil-space-setup (key next prev)
  "Setup `evil-space` for motion `key`

`SPC` and `S-SPC` are map to next and prev"
  `(progn
     (when (not (fboundp ',(intern (concat "evil-space-" next))))
       (fset ',(intern (concat "evil-space-" next))
         (symbol-function ',(lookup-key evil-motion-state-map next))))
     (when (not (fboundp ',(intern (concat "evil-space-" next))))
       (fset ',(intern (concat "evil-space-" prev))
         (symbol-function ',(lookup-key evil-motion-state-map prev))))
     (defadvice ,(lookup-key evil-motion-state-map key)
       (before ,(intern (concat (symbol-name (lookup-key evil-motion-state-map key)) "-space")) activate)
       ,(concat "Setup evil-space for motion " key)
       (define-key evil-normal-state-map ,evil-space-next-key ',(intern (concat "evil-space-" next)))
       (define-key evil-normal-state-map ,evil-space-prev-key ',(intern (concat "evil-space-" prev))))))

(evil-space-setup "n" "n" "N")
(evil-space-setup "N" "N" "n")
(evil-space-setup "t" ";" ",")
(evil-space-setup "f" ";" ",")
(evil-space-setup "T" "," ";")
(evil-space-setup "F" "," ";")
(evil-space-setup "{" "{" "}")
(evil-space-setup "}" "}" "{")
(evil-space-setup "]]" "]]" "[[")
(evil-space-setup "[[" "[[" "]]")

(provide 'evil-space)
