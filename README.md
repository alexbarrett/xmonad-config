XMonad Config
=============

Helper functions to split your workspaces across separate screens. Provides the
following features:

* Focusing a workspace will always display it on the same screen.
* Focusing a workspace when it's already active will switch back to the previous
  active workspace for that screen.

Instructions
------------

Merge `lib/XMonad/Util/FixedWorkspaces.hs` into your `.xmonad` directory tree.

`import XMonad.Util.FixedWorkspaces` in your `xmonad.hs`.

Define a function in your `xmonad.hs` that maps your workspaces to a screen ID.
For example, given workspaces 0..9 and wanting 1..6 to be on your first screen
and 7..9 and 0 on your second screen, you could define this function:

    myWorkspaceScreens ws
        | ws >= "7" = 1
        | ws == "0" = 1
        | otherwise = 0

Add keybinds for the `fixedView` function. Example:

    ++ [ ("M-" ++ ws,   windows $ fixedView myWorkspaceScreens ws) | ws <- myWorkspaces ]

See `xmonad.hs` for a full example.

Caveats
-------

When XMonad first starts it will still display your first 2 workspaces on
screens 1 and 2. Activate a workspace for the second monitor and things are as
they should be. Probably easy to fix but it's never bothered me because I
hardly ever restart XMonad 🙂