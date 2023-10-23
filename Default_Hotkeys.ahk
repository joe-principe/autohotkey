#Requires AutoHotkey v2.0
SendMode("Input") ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir(A_ScriptDir) ; Ensures a consistent starting directory.
SetTitleMatchMode(2)
CoordMode("Mouse", "Screen")

GroupAdd("Vidya", "Minecraft")
GroupAdd("Vidya", "ahk_exe ProjectZomboid64.exe")
GroupAdd("Vidya", "ahk_exe SkyrimSE.exe")
GroupAdd("Vidya", "ahk_exe openmw.exe")
GroupAdd("Vidya", "ahk_exe vermintide2_dx12.exe")
GroupAdd("Vidya", "ahk_exe TheBloodline.exe")

InstallKeybdHook
InstallMouseHook

; Triple Click
; Activated by Mouse4 + LClick
F23::
{
	Click(3)
	Sleep(150)
}

; Copy (ctrl + c)
; Activated by Mouse5 + LClick
F24::^c

; Types today's date in ISO-8601 format
; Replaces ::date when typed
:*:`:`:date::
{
	SendInput(FormatTime(, "yyyy-MM-dd"))
}

; Types today's date in US format
; replaces ::today when typed
:*:`:`:today::
{
	SendInput(FormatTime(, "MM-dd-yyyy"))
}

; Types the current time
; Replaces ::rn when typed
:*:`:`:rn::
{
	SendInput(FormatTime(, "h:mm tt"))
}

; Types the VHDL library includes std_logic_1164 and numeric_std
; Replaces ::vhdl_ieee when typed
:*:`:`:vhdl_ieee::
{
	SendText("library ieee;`nuse ieee.std_logic_1164.all;`nuse ieee.numeric_std.all;`n")
}

; Types out my name
; Replaces ::name when typed
:*:`:`:name::
{
	SendText("Joseph Principe")
}

; Toggles the mute status of the desktop microphone
; Activated by RAlt + `
; Displays a tray tip letting the user know the new mute status
>!`::
{
	MyGui := Gui("+ToolWindow", "Microphone")
	MyGui.SetFont("s24")
	
	if (SoundGetMute(, "Microphone"))
	{
		try SoundSetMute(0, , "Microphone")
		MyGui.Add("Text", , "Microphone Unmuted")
		MyGui.Show()
		MyGui.Move(-378, 933)
		;MyGui.Move(-378, 1143)
	}
	else
	{
		try SoundSetMute(1, , "Microphone")
		MyGui.Add("Text", , "Microphone Muted")
		MyGui.Show()
		MyGui.Move(-335, 933)
		;MyGui.Move(-335, 1143)
	}
	Sleep(1500)
	MyGui.Destroy()
	Return
} ; End of >!`::

; ======================== General video game hotkeys ======================== ;
#HotIf WinActive("ahk_group Vidya")
; Opens the map
; Activated with Mouse5 + q
XButton2 & q::m

; Opens the inventory
; Activated with Mouse5 + q
XButton2 & e::i

; Toggles the info/journal
; Activated with Mouse5 + q
XButton2 & r::j

; Toggles the health panel
; Activated with Mouse5 + q
XButton2 & f::h

; Presses the 6 key
; Activated by Mouse5 + 1
XButton2 & 1::6

; Presses the 7 key
; Activated by Mouse5 + 2
XButton2 & 2::7

; Presses the 8 key
; Activated by Mouse5 + 3
XButton2 & 3::8

; Presses the 9 key
; Activated by Mouse5 + 4
XButton2 & 4::9

; Presses the 0 key
; Activated by Mouse5 + 5
XButton2 & 5::0

; Auto left clicker
; Activated by pressing forward button behind wheel
F24::
{
	Click(10)
	Sleep(75)
}

; Auto right clicker
; Activated by pressing rear button behind wheel
F23::
{
	Click(, , "Right", 10)
	Sleep(75)
}
#HotIf ; End of general video game hotkeys

; ================================ Minecraft ================================ ;
#HotIf WinActive("Minecraft")
; Veinminer hotkey
; Activated by Mouse5 + LClick
; Vein mines when both keys are held down instead of having to hold tilde
XButton2 & ~LButton::~

; Activated by Mouse5 + ScrollUp
XButton2 & WheelUp::=

; Activated by Mouse5 + ScrollDown
XButton2 & WheelDown::-

; Opens the map
; Activated by Mouse5 + e
XButton2 & e::j

; Opens the waypoint menu
; Activated by Mouse5 + q
XButton2 & q::^b
#HotIf

; ================================ Overwatch ================================ ;
#HotIf WinActive("ahk_exe Overwatch.exe")
; "No" voiceline hotkey
; Activated by Mouse5 + r
XButton2 & r::Numpad6

; "Yes" voiceline hotkey
; Activated by Mouse5 + f
XButton2 & f::Numpad0

; "You're welcome" voiceline hotkey
; Activated by Mouse5 + v
XButton2 & v::NumpadDot

; Emote wheel hotkey
; Activated by Mouse5 + q
XButton2 & q::i

; Voice Line Menu - O -> E
; Voice line wheel hotkey
; Activated by Mouse5 + e
XButton2 & e::o
#HotIf

; ============================== The Bloodline ============================== ;
#HotIf WinActive("ahk_exe TheBloodline.exe")
; Opens the skill book menu
; Activated by Mouse5 + z
XButton2 & z::k

; Opens the skill tree menu
; Activated by Mouse5 + v
XButton2 & v::l
#HotIf

; ================================= Blender ================================= ;
#HotIf WinActive("ahk_exe blender-launcher.exe")

#HotIf

; ================================= Firefox ================================= ;
#HotIf WinActive("ahk_exe firefox.exe")
; New tab, paste, enter
; Activated by Shift + Alt + p
+!p::SendInput("^t^v{Enter}")
#HotIf

; Opens the strawberry music player
; Activated by RAlt + 1
; Checks if the player exists or is active, if not, runs/opens the player
#HotIf !WinExist("ahk_exe strawberry.exe") or !WinActive("ahk_exe strawberry.exe")
>!1::
{
	if (!WinExist("ahk_exe strawberry.exe"))
	{
		Run("C:\Program Files\Strawberry Music Player\strawberry.exe")
	}
	else if (!WinActive("ahk_exe strawberry.exe"))
	{
		WinActivate("ahk_exe strawberry.exe")
	}
	Return
}
#HotIf

; Opens the windows terminal
; Activated by Ctrl + Alt + tab
; Checks if the player exists or is active, if not, runs/opens the terminal
#HotIf !WinExist("ahk_exe WindowsTerminal.exe") or !WinActive("ahk_exe WindowsTerminal.exe")
^!t::
{
	if (!WinExist("ahk_exe WindowsTerminal.exe"))
	{
		Run("C:\Program Files\WindowsApps\Microsoft.WindowsTerminal_1.17.11461.0_x64__8wekyb3d8bbwe\wt.exe")
	}
	else if (!WinActive("ahk_exe WindowsTerminal.exe"))
	{
		WinActivate("ahk_exe WindowsTerminal.exe")
	}
	Return
	
}
#HotIf

; ============================ Windows Terminal ============================ ;
#HotIf WinActive("ahk_exe WindowsTerminal.exe")
; Disables CapsLock when returning to normal mode
; Activated by LCtrl + [
<^[::
{
	if (GetKeyState("CapsLock", "T"))
	{
		SetCapslockState(0)
	}
	SendInput("{LCtrl Down}[{LCtrl Up}")
}

; Disables CapsLock when returning to normal mode
; Activated by Esc
Esc::
{
	if (GetKeyState("CapsLock", "T")) 
	{
		SetCapslockState(0)
	}
	SendInput("{Esc}")
}
#HotIf
