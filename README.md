evil-space
==========
vim-space for evil-mode

`evil-space` is intend to be a ported version of `vim-space` for `evil-mode`
with some enhancement features such as remember count motions, e.g.

    9j SPC SPC SPC

To enable `evil-space`, add those lines to the `init.el`.

```el
(add-to-list 'load-path "/home/link/evil-space")
(require 'evil-space)
(evil-space-default-setup)
```

If you don't want to enable default setup for `evil-space` you can
enable the key motion you want manually:

```el
(add-to-list 'load-path "/home/link/evil-space")
(require 'evil-space)
(evil-space-setup "t" ";" ",")
(evil-space-setup "f" ";" ",")
(evil-space-setup "T" "," ";")
(evil-space-setup "F" "," ";")
```

The default key trigger are `<SPC>` and `<S-SPC>` but you can
customize them to your like by:

```el
M-x customize-group RET evil-space RET
```

Pull requests are very welcome, for further information, make an issue
or contact me at linktohack@gmail.com.
