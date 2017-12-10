import XMonad
import XMonad.Util.EZConfig

main = xmonad $ def {
    borderWidth = 5,
    normalBorderColor = "#252525",
    focusedBorderColor = "#11749C",
    terminal = "urxvt",
    startupHook = do
      spawn "~/.xmonad/startup-hook"
  }

  `additionalKeys` [
    ((mod1Mask, xK_d), spawn "rofi -font \"Share-TechMonoTrue 10\" -show run -terminal urxvt -bg \"#252525\" -fg \"#f5f5f5\" -hlbg \"#11749C\" -hlfg \"#FFFFFF\"")
  ]
