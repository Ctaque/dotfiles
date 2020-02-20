import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import XMonad.Config.Desktop
import qualified XMonad.StackSet as W
import XMonad.Util.EZConfig

main :: IO ()
main = do
       xmproc <- spawnPipe "xmobar"
       xmproc <- spawnPipe "xscreensaver -nosplash"
       xmproc <- spawnPipe "dmenu"
       xmproc <- spawnPipe "feh $HOME/Images/Wallpapers"

       xmonad $ defaultConfig { manageHook = manageDocks <+> manageHook defaultConfig
                              , layoutHook = avoidStruts $ layoutHook defaultConfig
                              , handleEventHook = handleEventHook defaultConfig <+> docksEventHook
                              , terminal = myTerminal
                              , workspaces = myWorkspaces
                              , normalBorderColor = myNormalBorderColor
                              , focusedBorderColor = myFocusedBorderColor
                              , borderWidth = myBorderWidth
                              }  `additionalKeysP` myKeys

myTerminal = "terminator"
myBorderWidth = 2
myNormalBorderColor = "black"
myFocusedBorderColor = "#8908F0"
myKeys = [ ("M-<Up>", windows W.swapUp)
         , ("M-<Down>", windows W.swapDown)
         , ("M-f", spawn "firefox")
         , ("M-c", spawn "google-chrome")
         , ("M-e", spawn "emacs")
         , ("M-s", spawn "spotify")
         , ("M-v", spawn "code")
         , ("M-n", spawn "nautilus")
         , ("M-l", spawn "xscreensaver-command -lock")
         ]
myWorkspaces :: [String]
myWorkspaces = ["1:Web", "2:Work", "3:Media"]
