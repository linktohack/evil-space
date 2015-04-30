# evil-space

[vim-space](https://github.com/linktohack/vim-space) for `evil-mode`

`evil-space` is intend to be a ported version of `vim-space` for `evil-mode`
with some enhanced features such as remember count motions.

The most obvious outcome is to liberate the `semicolon` <kbd>;</kbd> and
`comma` <kbd>,</kbd> to map them to `evil-ex` and `evil-leader` but still keep
`evil-find-char-next` and `-previous` working.

> <kbd>f</kbd><kbd>a</kbd><kbd>SPC</kbd><kbd>SPC</kbd><kbd>S-SPC</kbd>

## Install

The easiest way to install `evil-space` is by `package.el` through melpa
[melpa](http://melpa.milkbox.net/#/getting-started) then try it with

```lisp
M-x evil-space-mode
```

To enable `evil-space` permanently, add

```lisp
(evil-space-mode)
```

to your `init.el`.

Or manually by clone `evil-space` to your `load-path`, then add those
lines to the `init.el`.

```lisp
(add-to-list 'load-path "/path/to/evil-space")
(require 'evil-space)
(evil-space-mode)
```

## Default bindings

The default binding provided by `(evil-space-mode)` will enable repeat
for these motions:

```
/?nN (search)
tTfF (next character in line)
}{ (paragraph)
]] and [[ (function)
)( (sentence)

and

-, + gj, gk for some one still keep the default behavior of next line.

```

If you don't like the default behavior for `evil-space` you can
enable the key motion you want manually:

```lisp
(add-to-list 'load-path "/path/to/evil-space")
(require 'evil-space)
(evil-space-setup "t" ";" ",")
(evil-space-setup "f" ";" ",")
(evil-space-setup "T" "," ";")
(evil-space-setup "F" "," ";")
```

## Trigger keys

The default trigger keys are `<SPC>` and `<S-SPC>` but you can
customize them to your like by:

```lisp
M-x customize-group RET evil-space RET
```

## Further information

Pull requests are very welcome, for further information, please make an
issue
