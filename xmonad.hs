-- from http://kalgan.cc/blog/posts/Gnome_3_and_XMonad/

import XMonad
import XMonad.Hooks.ManageHelpers
import XMonad.Config.Gnome
import XMonad.Layout.NoBorders
import XMonad.Actions.WindowGo
import XMonad.Util.EZConfig
    
myManageHook = composeAll [
  (className =? "Gnome-panel" <&&> title =? "Run Application") --> doCenterFloat,
  isFullscreen --> doFullFloat
  ]

myKeys = [
  ((mod4Mask, xK_c), runOrRaiseNext "google-chrome" (className =? "Google-chrome")),
  ((mod4Mask, xK_e), runOrRaiseNext "emacs" (className =? "Emacs24"))
  ]
                     
main = xmonad $ gnomeConfig {
  modMask            = mod4Mask
  , layoutHook         = smartBorders (layoutHook gnomeConfig)
  , borderWidth        = 2
  , normalBorderColor  = "#cccccc"
  , focusedBorderColor = "#3300ff"
  , manageHook         = myManageHook <+> manageHook gnomeConfig
  } `additionalKeys` myKeys
