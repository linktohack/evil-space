;;; evil-space.el --- Repeat motion in Evil. Correct the behaviour of what SPC should do.

;; Copyright (C) 2015 Quang Linh LE

;; Author: Quang Linh LE <linktohack@gmail.com>
;; URL: http://github.com/linktohack/evil-space
;; Version: 0.0.5
;; Keywords: space repeat motion
;; Package-Requires: ((evil "1.0.0"))

;; This file is not part of GNU Emacs.

;;; License:

;; This file is part of evil-space
;;
;; evil-space is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published
;; by the Free Software Foundation, either version 3 of the License,
;; or (at your option) any later version.
;;
;; evil-space is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; This program emulates vim-space initially developed by Henrik Öhman
;; (spiiph) It help you using <SPC> key to repeat the last motion like
;; what the dot <.> key does to repeat the last command. The motion
;; are normally setup in pair, that means the <S-SPC> (or customized
;; to what one needs) to reverse that motion.

;;; Example:
;;
;; After hits <}> to go to next paragraph, hits <SPC> again will move
;; to the next one, while <S-SPC> will move to the previous one.


;;; Code:

(require 'evil)

(defgroup evil-space nil
  "Repeat motion in Evil"
  :group 'evil
  :prefix "evil-space-")

(eval-and-compile
  (defcustom evil-space-next-key (kbd "SPC")
    "Key that triggers the repeat motion."
    :group 'evil-space)
  (defcustom evil-space-prev-key (kbd "S-SPC")
    "Key that triggers the repeat motion in reverse direction."
    :group 'evil-space))

;;;###autoload
(defmacro evil-space-setup (key next prev &optional keymap)
  "Makes KEY repeatable with `evil-space-next-key' and `evil-space-prev-key'.

NEXT and PREV represent the key bindings that repeat KEY forward and backwards,
respectively.

KEYMAP, if non-nil, specifies where to lookup KEY, NEXT and PREV. If nil, it
defaults to `evil-motion-state-map'.

Examples:
    (evil-space-setup \"f\" \";\" \",\")

    ;; Probably not a great idea.
    (evil-space-setup \"s-/\" \"s-/\" \"s-/\" evil-commentary-mode-map)

    ;; Map * in evil-visualstar-mode-map, in visual state
    (evil-space-setup \"*\" \"n\" \"N\" (evil-get-auxiliary-keymap evil-visualstar-mode-map 'visual)) "
  (let* ((keymap (or (if keymap (eval keymap)) evil-motion-state-map))
         (func-next (intern (concat "evil-space--" next)))
         (func-prev (intern (concat "evil-space--" prev)))
         (key-to-replace (or (lookup-key keymap key)
                             (error "Could not find %s" key)))
         (key-func-next  (or (lookup-key keymap (kbd next))
                             (lookup-key evil-motion-state-map (kbd next))
                             (error "Could not find next key: %s" next)))
         (key-func-prev  (or (lookup-key keymap (kbd next))
                             (lookup-key evil-motion-state-map (kbd prev))
                             (error "Could not find previous key: %s" prev))))
    `(progn
       (fset ',func-next (symbol-function ',key-func-next))
       (fset ',func-prev (symbol-function ',key-func-prev))
       (defadvice ,key-to-replace
         (before ,(intern (concat (symbol-name key-to-replace) "-space")) activate)
         ,(format "Setup evil-space for motion %s. Its delegates are `%s' and `%s'" key func-next func-prev)
         (evil-define-key 'motion evil-space-mode-map ,evil-space-next-key ',func-next)
         (evil-define-key 'motion evil-space-mode-map ,evil-space-prev-key ',func-prev)))))

;;;###autoload
(define-minor-mode evil-space-mode
  "Evil space mode."
  :lighter " SPC"
  :global t
  :keymap (make-sparse-keymap)
  (evil-space-setup "gj" "gj" "gk")
  (evil-space-setup "gk" "gk" "gj")
  (evil-space-setup "-" "-" "+")
  (evil-space-setup "+" "+" "-")

  ;; search motions
  (evil-space-setup "n" "n" "N")
  (evil-space-setup "N" "N" "n")
  (evil-space-setup "t" ";" ",")
  (evil-space-setup "f" ";" ",")
  (evil-space-setup "T" "," ";")
  (evil-space-setup "F" "," ";")
  (evil-space-setup "*" "*" "#")
  (evil-space-setup "#" "#" "*")

  ;; block motions
  (evil-space-setup "(" "(" ")")
  (evil-space-setup ")" ")" "(")
  (evil-space-setup "{" "{" "}")
  (evil-space-setup "}" "}" "{")
  (evil-space-setup "]]" "]]" "[[")
  (evil-space-setup "[[" "[[" "]]"))

;;;###autoload
(define-obsolete-function-alias 'evil-space-default-setup
  'evil-space-mode "0.0.4")


(provide 'evil-space)

;;; evil-space.el ends here
