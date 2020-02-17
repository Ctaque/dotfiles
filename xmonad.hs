import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import XMonad.Config.Desktop
import XMonad.Wallpaper

main = do
       xmproc <- spawnPipe "xmobar"
       xmproc <- spawnPipe "xscreensaver -nosplash"

       setRandomWallpaper ["$HOME/Images"]
       xmonad $ defaultConfig { manageHook = manageDocks <+> manageHook defaultConfig
                              , layoutHook = avoidStruts $ layoutHook defaultConfig
                              , handleEventHook = handleEventHook defaultConfig <+> docksEventHook
                              , terminal = myTerminal
                              , normalBorderColor = myNormalBorderColor
                              , focusedBorderColor = myFocusedBorderColor
                              , borderWidth = myBorderWidth
                              }

myTerminal = "urxvt"
myBorderWidth = 2
myNormalBorderColor = "black"
myFocusedBorderColor = "red"
