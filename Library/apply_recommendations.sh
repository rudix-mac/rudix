#!/usr/bin/osascript
(* -*-mode: applescript-*- *)

on run arguments
	set pmdoc to item 1 of arguments
	"Starting PackageMaker..."
	tell application "System Events"
		tell process "PackageMaker"
			activate
			click UI element 1 of group 1 of row 1 of outline 1 of scroll area 2 of group 1 of window pmdoc
			select row 2 of outline 1 of scroll area 2 of group 1 of window pmdoc
			click radio button "Contents" of tab group 1 of group 1 of group 1 of window pmdoc
			repeat while not enabled of button "Apply Recommendations" of tab group 1 of group 1 of group 1 of window pmdoc
			       delay 0.2
			end repeat
			click button "Apply Recommendations" of tab group 1 of group 1 of group 1 of window pmdoc
			repeat while not enabled of menu item "Save" of menu 1 of menu bar item "File" of menu bar 1
				delay 0.2
			end repeat
			click menu item "Save" of menu 1 of menu bar item "File" of menu bar 1
			click menu item "Close" of menu 1 of menu bar item "File" of menu bar 1
			click menu item "Quit PackageMaker" of menu 1 of menu bar item "PackageMaker" of menu bar 1
			"Closing PackageMaker..."
		end tell
	end tell
end run
