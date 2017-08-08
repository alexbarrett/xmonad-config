import XMonad
import XMonad.Actions.CycleWS
import XMonad.Util.EZConfig
import XMonad.Util.FixedWorkspaces -- lib
import qualified XMonad.StackSet as W

myWorkspaces = show <$> [1..9] ++ [0]

myWorkspaceScreens ws
    | ws >= "7" = 1
    | ws == "0" = 1
    | otherwise = 0

-- Keybindings
myKeys =
    [ ("M-<Return>", spawn $ terminal myConfig)
    , ("M-h",   prevScreen)
    , ("M-l",   nextScreen)
    , ("M-S-h", shiftPrevScreen)
    , ("M-S-l", shiftNextScreen)
    ]
    ++ [ ("M-" ++ ws,   windows $ fixedView myWorkspaceScreens ws) | ws <- myWorkspaces ]
    ++ [ ("M-S-" ++ ws, windows $ W.shift ws)                      | ws <- myWorkspaces ]

myConfig = def
    { modMask     = mod4Mask
    , terminal    = "urxvt256c-ml"
    , workspaces  = myWorkspaces
    , focusFollowsMouse = False
    , clickJustFocuses  = False
    }
    `additionalKeysP` myKeys

main = xmonad myConfig

